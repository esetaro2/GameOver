<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.util.*,com.model.javabeans.*"%>
<%
UserBean user1 = (UserBean) request.getSession().getAttribute("current_user");%>
<!DOCTYPE html>
<html>
<head>

    <!--IMPORTO IL FILE CSS DEDICATO ALL'HEADER DELLA HOMEPAGE)-->
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/default.css">
    <!-- Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 
    
</head>

<body>
	<!-- bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    	
    <!--DEFINISCO IL CONTENITORE DELLA BARRA DI NAVIGAZIONE DEL SITO-->
    <nav>

        <!--DEFINISCO LA LISTA CHE CONTIENE  I COLLEGAMENTI ALLE VARIE SEZIONI DEL SITO WEB-->
        <ul class="nav-list">

            <!--DEFINISCO IL LOGO DEL SITO-->
            <li class="nav-item logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></li>

            <!--DEFINISCO LE ICONE CHE SARANNO UTILIZZATE PER DIRIGERE L'UTENTE ALLE VARIE SEZIONI DEL SITO (PC, PLAYSTATION, XBOX, NINTENDO, WISHLIST, AREA UTENTE, CARRELLO)-->
            <li class="nav-item platform"><a href="SortPlatformServlet?action=Pc"><img class="navico platform" src="img/pcico.png" alt="pcico"></a></li>
            <li class="nav-item platform"><a href="SortPlatformServlet?action=Ps"><img src="img/playstationico.png" alt="playstationico" class="navico platform"></a></li>
            <li class="nav-item platform"><a href="SortPlatformServlet?action=Xbox"><img src="img/xboxico.png" alt="xboxico" class="navico platform"></a></li>
            <li class="nav-item platform"><a href="SortPlatformServlet?action=Nint"><img src="img/nintendoico.png" alt="nintendoico" class="navico platform"></a></li>
            <li class="nav-item">
                <img class="navico" id="userbtn1" src="img/user.svg" alt="userico" onclick="showdiv()">
                <img src="img/user.svg" alt="userico" class="navico" id="userbtn2" onclick="hidediv()">
            </li>
            <li class="nav-item"><a href="cart.jsp"><img class="navico" src="img/cart.svg" alt="cartico"></a></li>
        </ul>

        <div class="usermini" id="usermini" onmouseleave="hidediv()">
            <p>Ciao, <span><%= user1.getUsername()%></span><br>
            <a href="user.jsp"><img src="img/gamepad.png" alt="person"></a><br>
            <a href="user.jsp">Vai alla tua area riservata</a><br><br>
            <span>oppure</span><br><br>
            <a href="LogoutServlet"><button>Esci</button></a></p>
        </div>
    </nav><br><br><br>

    <!-- SLIDESHOW -->
   <div class="customSlideshow">
    <div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
  <div class="carousel-inner" >
    <div class="carousel-item active" >
      <img src="img/slide1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/slide2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/slide3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  
  <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
    <script src="js/userdiv.js"></script>
</body>
</html>