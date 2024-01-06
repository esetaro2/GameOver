<!DOCTYPE html>
<html lang="en">
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
    
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/log.css">

    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/validation.js"></script>
    
    <!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
    <link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">
    <title>Game Over</title>
</head>
<body>

    <div id="container">
        <div id="main">
            <div class="regcontainer">
                <div class="middle">
                    <div class="title">
						<a href="index.jsp"><img src="img/logo.png" alt="logo"></a>
                        <h1>Accedi</h1>
                    </div><br>

                    <div class="formcontainer">
                        <form id="form">
               		        <label for="user">Username</label><br>
               		        <input type="text" name="user" id="username" placeholder="sonicboom123" ><br>
                	        <div id="errorPass1">Errore... non inserire caratteri speciali($%&/...)</div>
							
                	        <label for="pwd">Password</label><br>
                	        <input type="password" name="pwd" id="password" placeholder="********" required><br>
               		        <div id="errorPass2">Il campo vuoto inserisci qualcosa</div>

                            <a href="passreset.jsp">Ho dimenticato la password</a><br><br>

							<input type="submit" id="submit" value="Accedi"><br>
                            <a href="register.jsp">Non hai un account? CLicca qui per crearne uno</a><br><br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>