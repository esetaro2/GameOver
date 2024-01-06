<!DOCTYPE html>
<html>
<head>
    <!--IMPORTO IL FILE CSS DEDICATO ALL'HEADER-->
    <link rel="stylesheet" href="css/header.css">
</head>

<body>

	<!-- CONTAINER DELLA BARRA DI NAVIGAZIONE -->
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
             <a  href="login.jsp"> <img class="navico" id="userbtn1" src="img/user.svg" alt="userico" ></a>
                        </li>
            <li class="nav-item"><a href="cart.jsp"><img class="navico" src="img/cart.svg" alt="cartico"></a></li>
        </ul>

    </nav><br><br><br><br><br>

</body>
</html>