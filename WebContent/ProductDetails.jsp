<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util. * ,com.model.javabeans.* " %>
<% ProductBean bean = (ProductBean) request.getAttribute("descrizione"); %>
<%UserBean user = (UserBean) request.getSession().getAttribute("current_user"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

 

	<link rel="stylesheet" href="css/default.css">
    <!--IMOPORTO LA LIBRERIA FONT-AWESOME CHE SI OCCUPERA' DI ALCUNE ICONE DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    
    <!-- DA FIXARE -->
	

    <!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
    <link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">
    
    <!-- CSS only bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
    	.modal-header{
    		background:rgb(77,77,77);
    		color:white;
    	}
    </style>
    <title>Game Over</title>
</head>

<body style="color:white;">

	<div id="containerDetails">
		<div id="main" >
			<%if(user == null) {%>
			<!-- INCLUDO FRAMMENTO HEADER HOMEPAGE GUEST USER -->
			
			<%@include file = "../frammenti/unloggedheader.jsp"%><%} else{%> <%@ include file="../frammenti/loggedheader.jsp" %><%}%>
			<%@ include file="../frammenti/searchbar.jsp" %><br>
			<section id="hero" style="background-image: url(${pageContext.request.contextPath}/img/back<%=bean.getId()%>.jpg);" >
			<img src="./img/<%= bean.getImg().substring(bean.getImg().lastIndexOf("img")+4) %>" class="img-thumbnail" alt="Responsive image">
				
					<h4 style="font-size: 30px;"><mark style="background-color:rgb(255, 84, 0)"><%= bean.getNome() %></mark></h4>
					
					<div class="game-details">
					<h4 style="font-size:30px; font-weight:bold;"><%= bean.getPrezzo() %> &euro;</h4>		
					
					
					<a class="btn btn-primary" href="CartServlet?action=addcart&id=<%=bean.getId()%>" id="put-in-cart" 
					style="background-color:rgb(255, 84, 0); border-style:none; height:37px; width:210px;margin-top:10px;margin-bottom:10px;">Aggiungi al carrello</a>
					<%if(user!=null && user.getAdmin()==1){%>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false"
						style="background-color:red; border-style:none; height:37px; width:210px; margin-top:10px;margin-bottom:10px;">Modifica Prodotto
						</button>
						
						<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal">Modifica Titolo</a></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal2">Modifica Prezzo</a></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal3">Modifica IVA</a></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal4">Modifica Descrizione</a></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal5">Modifica Quantità</a></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal6">Modifica Genere</a></li>
												    <li><hr class="dropdown-divider"></li>
												    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#myModal7">Elimina Prodotto</a></li>
	 					 </ul>
												  
												  
												  
										<%@ include file="../frammenti/modals.jsp" %>		  
												 
					
					</div>
						<%}%>
							
					</div>
					
					
					</section>
					
					<div class="game-description-details">
					
					<h3 style="font-weight:bold"> Riguardo al gioco:</h3>
					<h2 style="font-size:16px"><%= bean.getDescr() %></h2>
					<h5 style="font-weight:bold">Genere: <%=bean.getGenere() %></h5>
					</div>
				</div>
			</div>
		
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	
	<%@ include file="../frammenti/footer.jsp" %>
</body>
</html>