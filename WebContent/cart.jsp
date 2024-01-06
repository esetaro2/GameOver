<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.model.javabeans.*,com.model.dao.* , java.util.*"%>

<%
Cart cart = (Cart) request.getSession().getAttribute("cart");
ProductDAO model = new ProductDAO();
PaymentDAO model1= new PaymentDAO();

UserBean utente = (UserBean) request.getSession().getAttribute("current_user");
double totaleProdotto = 0;
int quantTot=0;
PaymentBean Paybean=null;

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--IMPORTO IL FONT MONTSERRAT DA GOOGLE FONT-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&display=swap"
	rel="stylesheet">

<!--IMPORTO LA LIBRERIA ANIMATE.CSS CHE SI OCCUPA DELLE ANIMAZIONI DELLA PAGINA WEB-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

<!--IMOPORTO LA LIBRERIA FONT-AWESOME CHE SI OCCUPERA' DI ALCUNE ICONE DELLA PAGINA WEB-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--IMPORTO IL FILE CSS DEFDICATO AL RESET DELLO STILE DI DEAFULT DELLA PAGINA WEB-->
<link rel="stylesheet" href="css/default.css">

<!--IMPORTO IL FILE CSS DEDICATO ALL'HEADER DELLA HOMEPAGE)-->
<link rel="stylesheet" href="css/header.css">

<!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
<link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">

<link rel="stylesheet" href="css/cart.css">

<title>Game Over</title>
</head>
<body>
	<div id="container">
		<div id="main">
			<!-- CONTAINER DELLA BARRA DI NAVIGAZIONE -->
			<%if(utente == null) {%>
			<!-- INCLUDO FRAMMENTO HEADER HOMEPAGE GUEST USER -->
			<%@ include file="../frammenti/unloggedheader.jsp"%>
			<%} else{%>
			<%@ include file="../frammenti/loggedheader.jsp"%>
			<%} %>
					<%
						

							if (cart != null && cart.getProducts().size() != 0) {
				HashMap<Integer, Integer> carrello = cart.getProducts();

						for (Map.Entry<Integer, Integer> entry : carrello.entrySet()) {
					ProductBean bean = model.doRetrieveByKey(entry.getKey());
					int quantita = entry.getValue();
					double tot = quantita * bean.getPrezzo();
					totaleProdotto += tot;
			%>
			<div class="containercart">
					
						
				<div class="cartcontainer">
				
					<div class="product">
					
						<div class="imgcontainer">
							<img src="./img/<%=bean.getImg().substring(bean.getImg().lastIndexOf("img")+4)%>" class="imgCart" alt="game12" >
						</div> 
						<div class="nameactcontainer">
							<div class="nameproduct">
								<h1><%=bean.getNome() %></h1>
							</div>
							<div class="price">
								<h2><%=bean.getPrezzo() %>&euro;</h2>
								<br> <em><span>Quantitità: </span> <span><%=quantita %> </span></em><br><br>
								<form action="UpdateQuantity" method="post">
									<input class="priceProduct" type="hidden" name="price" value="<%=bean.getPrezzo()%>">
									<input class="idProduct" type="hidden" name="id" value="<%=bean.getId()%>">
									<input class="quantity" type="number" name="quantity" min="1" max="<%=bean.getQuanTot()%>" value="<%=quantita%>">
									<input type="submit" value=">" style="font-weight: bold;">
								</form>
							</div>
							<div class="actioncart">
								<a href="CartServlet?action=deletefromcart&id=<%=bean.getId()%>"><button style="border: none; background: transparent"><img src="img/delete.png" alt="trash" width="35px" style="cursor: pointer;"></button></a>
							</div>
									
						</div>
			
	
					</div>
					
				</div>
				<%}  } %>
		
		<%if(utente != null){ 
		
			Collection<?> metodoP = model1.doRetrieveByUser(utente.getIdUtente());
		%>
					<div class="orderinfo">
						<h2>Riepilogo ordine</h2>
						<br>
						<p>
							Indirizzo di spedizione: <span><%=utente.getCitta() %> -Via/Piazza <%=utente.getVia() %> - N °<%=utente.getnCivico() %></span>
						</p>
						<br>
						<p>
							Metodo di pagamento utilizzato: <br>
							<br>
						<div class="paymentuser">
						<%if(metodoP != null && metodoP.size()!=0){
							Iterator<?> it =metodoP.iterator();
								while(it.hasNext()){
							Paybean = (PaymentBean)it.next();%>
							<div class="creditcard">
								<div class="chipcontainer">
									<img src="img/chip.png" alt="chip">
								</div>
								<div class="banklogo">
									<img src="img/banklogo.png" alt="banklogo">
								</div>
								<div class="numbercard" style="margin-top: 40px;">
									<p><%= Paybean.getNcarta() %></p>
								</div>
								<div class="expiresdate">
									<p>
										VALID<br>THRU<span><%=Paybean.getMeseScad() %>/<%=Paybean.getAnnoScad() %></span>
									</p>
								</div>
								<div class="nomecontainer" style="margin-top: 30px;">
									<div class="name">
										<p><%=utente.getNome() %> <%=utente.getCognome() %></p>
									</div>
								</div>
								<div class="cvv" style="margin-top: 15px;">
									<p>
										CVV: <span><%=Paybean.getCvv() %></span>
									</p>
								</div>
							</div>
							<%}} %>
						</div>
						<p>Articoli:</p>
			<%
						

							if (cart != null && cart.getProducts().size() != 0) {
				HashMap<Integer, Integer> carrello = cart.getProducts();

						for (Map.Entry<Integer, Integer> entry : carrello.entrySet()) {
					ProductBean bean = model.doRetrieveByKey(entry.getKey());
					int quantita = entry.getValue();
					double tot = quantita * bean.getPrezzo();
					totaleProdotto += tot;
					quantTot += quantita;
					
			%>

						<p>
						 <br>
							<span><%=bean.getNome() %> * <%= quantita %> = <%=String.format("%.2f",tot) %> </span>&euro;
						</p>
							<%}} %>
						<br>

						<p id="totalprice">
							TOTALE: <span><%=String.format("%.2f",totaleProdotto) %></span>&euro;
						</p>
						<form action="CheckOutOrder" method="Get">
						
						<input type="hidden" name="idUtente" value="<%=utente.getIdUtente() %>"><input type="hidden" name="idPagamento" value="<%=Paybean.getIdPagamento() %>"><input type="hidden" name="quantityTot" value="<%=quantTot %>"> <input type="hidden" name="prezzoTot" value="<%=totaleProdotto %>"><input type="submit" class="ordercomplete" value="Acquista">
						</form>
					
			
				</div>
		
			</div>
		
	</div>
		
	</div>
<%}else{ %>
	<div class="unloggedDiv">
		<h3 style="text-align:center; color: white">Non hai effettuato il login , se vuoi procedere col pagamanto registrati o effettua il login <a style="color: red" href="login.jsp" class="loga">QUI</a></h3>
		</div>
<%} %>
	<script src="js/userdiv.js"></script>
</body>
</html>