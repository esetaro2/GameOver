<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.javabeans.*, java.util.*"%>
    
<%
	Collection<?> articoli = (Collection<?>)request.getSession().getAttribute("search_prodotti");
	UserBean user = (UserBean) request.getSession().getAttribute("current_user");
	%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--IMPORTO IL FONT MONTSERRAT DA GOOGLE FONT-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&display=swap" rel="stylesheet">

    <!--IMPORTO LA LIBRERIA ANIMATE.CSS CHE SI OCCUPA DELLE ANIMAZIONI DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">


    <!--IMOPORTO LA LIBRERIA FONT-AWESOME CHE SI OCCUPERA' DI ALCUNE ICONE DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!--IMPORTO IL FILE CSS DEFDICATO AL RESET DELLO STILE DI DEAFULT DELLA PAGINA WEB-->
    <link rel="stylesheet" href="css/default.css">
    
    <!-- IMPORTO IL FILE CSS RISERVATO ALLA GRIGLIA DEI GIOCHI -->
    <link rel="stylesheet" href="css/grid.css">

    <!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
    <link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">
    
       
    </style>
    <title>Game Over</title>
</head>

<body>
	<div id="container">
		<div id="main">
			<%if(user == null) {%>
				<!-- INCLUDO FRAMMENTO HEADER HOMEPAGE GUEST USER -->
				<%@ include file = "../frammenti/unloggedhomepageheader.jsp"%><%} else{%> <%@ include file="../frammenti/loggedhomepageheader.jsp" %> <%} %><br>
				<%@ include file="../frammenti/searchbar.jsp" %>
				
				
				<!-- post e´ piu´ sicuro di get, non conserva informazioni, utile per pw-->
				<%if(user!=null && user.getAdmin()==1){%>
					<h3 style="text-align: center; margin-top: 40px"><a href="AdminServlet2?action=mostra" class="productaccess">ACCEDI ALLA GESTIONE PRODOTTI E ORDINI ADMIN</a></h3><%}%>
	 		
	 		<div class="gamesgrid" >
       			<%if(articoli != null && articoli.size()!=0){
					Iterator<?> it =articoli.iterator();
					while(it.hasNext()){
						ProductBean bean = (ProductBean)it.next();%>
				<div class="game">
					<a href="ProductsServlet?action=dettagli&id=<%=bean.getId()%> "><img class="cover" src="./img/<%=bean.getImg().substring(bean.getImg().lastIndexOf("img")+4)%>"></a>
					<div class="game-title">
						<div class="game-price">
							<p><span><%=bean.getNome()%></span>        <span class="price"><%= bean.getPrezzo() %>&euro;</span></p><br>
		 					<!--  va bene ma implementa con js-->  
							<%if(user!=null && user.getAdmin()==1){%>
								<a style="color:red" href="AdminServlet2?action=removeFromDB&IdBean=<%=bean.getId()%>">Rimuovi dal Database</a><%}%> 
						</div>
		 			</div>
				</div><%}}else{%>
					
					<h2 style="color:red">Nessun prodotto Trovato</h2>
				
				<%} %>
			</div>
			</div>
			</div>
</body>
</html>