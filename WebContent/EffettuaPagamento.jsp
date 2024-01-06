<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.javabeans.*, java.util.* ,java.util.HashMap, java.util.Map, com.model.javabeans.*, com.model.dao.*"%>
    
<%	UserBean user = (UserBean) request.getAttribute("utente");
	Collection<?> metodi = (Collection<?>) request.getAttribute("metodiUser1");
	Cart cart = (Cart) request.getSession().getAttribute("carrello");

	ProductDAO model = new ProductDAO();
	    
	
 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--IMPORTO IL FONT MONTSERRAT DA GOOGLE FONT-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&display=swap" rel="stylesheet">

    <!--IMPORTO LA LIBRERIA ANIMATE.CSS CHE SI OCCUPA DELLE ANIMAZIONI DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!--IMOPORTO LA LIBRERIA FONT-AWESOME CHE SI OCCUPERA' DI ALCUNE ICONE DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--IMPORTO IL FILE CSS DEFDICATO AL RESET DELLO STILE DI DEAFULT DELLA PAGINA WEB-->
    <link rel="stylesheet" href="css/default.css">

    <!--IMPORTO IL FILE CSS DEDICATO ALL'HEADER DEL SITO (DELLA HOMEPAGE)-->
    <link rel="stylesheet" href="css/homepageHeader.css">
    
    <!-- IMPORTO IL FILE CSS RISERVATO ALLA GRIGLIA DEI GIOCHI -->
    <link rel="stylesheet" href="css/grid.css">
    
    <!--IMPORTO IL FILE CSS DEDICATO AL FOOTER-->
    <link rel="stylesheet" href="css/footer.css">

    <!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
    <link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">
    <title>Game Over</title>
</head>

<body>



<%if(user == null) {%>
	<!-- INCLUDO FRAMMENTO HEADER HOMEPAGE GUEST USER -->
	<%@ include file = "../frammenti/unloggedheader.jsp"%><%} else{%> <%@ include file="../frammenti/loggedheader.jsp" %> <%} %>


<!-- Riepilogo dell'ordine + tabella per elencare i metodi di pagamento presenti già o nel caso aggiungere un metodo di pagamento -->
	
	
	
	<h3>Riepilogo ordine</h3>
		
		<%
			double totale = 0;
			int quantTot =0;
			
			if(cart!=null && cart.getProducts().size()!=0){
			
			HashMap<Integer, Integer> carrello = cart.getProducts();
			
			for (Map.Entry<Integer, Integer> entry : carrello.entrySet()) {
				ProductBean bean = model.doRetrieveByKey(entry.getKey());
				
				int quant = entry.getValue();
				double tot = quant * bean.getPrezzo();
				totale +=tot;
				quantTot += quant;
			%>
		
		<p><%=bean.getNome() %>  -------------------------------------- <%=bean.getPrezzo() %> * <%=quant %> </p>
		
		
<%} %>
		
		<br><br><p style="text-align:right; margin-right:40px; font-size:22px">Totale prezzo :                                                 <%=totale %> Euro</p>		
		<%} %>
		
		<br><br><br><br>
		

		<p>Procedi con l'acquisto</p>
		
		<table>		
				<tr>
					<th>Numero Carta</th>
					<th>CVV</th>
					<th>Data Scadenza</th>
					<th>Acquisto</th>
				</tr>
		
			<% if(metodi != null && metodi.size()!=0){
				
				Iterator<?> it =metodi.iterator();
				while(it.hasNext()){
				PaymentBean bean1 = (PaymentBean)it.next();	
				%>
				
				<tr>
					<th><%=bean1.getNcarta() %></th>
					<th><%=bean1.getCvv() %></th>
					
					<th><form action="CheckOutOrder" method="get">
					<!-- Questa cosa non so se serve ma nel caso servisse basta togliere i commenti  
					<input type="hidden" name="NCarta" value="<%=bean1.getNcarta() %>"><input type="hidden" name="CVV" value="<%=bean1.getCvv() %>"><input type="hidden" name="dataS" value="<%=bean1.getDataScad() %>"> 
					-->
					<input type="hidden" name="idUtente" value="<%=user.getIdUtente() %>"><input type="hidden" name="idPagamento" value="<%=bean1.getIdPagamento() %>"><input type="hidden" name="quantityTot" value="<%=quantTot %>"> <input type="hidden" name="prezzoTot" value="<%=totale %>"><input type="submit" value="procedi con l'ordine"></form></th>
				</tr>
				
			<%}} %>
		
		</table>
		
		<h4>Se non hai un metodo di pagamento o vuoi aggiungerne un altro clicca <a href="UserArea.jsp">QUI</a></h4>
		

</body>
</html>