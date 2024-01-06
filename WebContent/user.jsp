<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.model.javabeans.*,com.model.dao.*, java.util.*"%>
    
<%UserBean utente = (UserBean) request.getSession().getAttribute("current_user");
PaymentDAO model1= new PaymentDAO();


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
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;900&display=swap" rel="stylesheet">
    
    
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300;400;700&display=swap" rel="stylesheet">

    <!--IMPORTO LA LIBRERIA ANIMATE.CSS CHE SI OCCUPA DELLE ANIMAZIONI DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!--IMOPORTO LA LIBRERIA FONT-AWESOME CHE SI OCCUPERA' DI ALCUNE ICONE DELLA PAGINA WEB-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/default.css">
    <link rel="stylesheet" href="css/user.css">
    
    <!--IMPOSTO L'ICONA CHE APPARIRA' AFFIANCO AL TITOLO DEL SITO WEB-->
    <link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">
    <title>Game Over</title>
</head>
<body>
	
	<%if(utente != null){ 
		Collection<?> metodoP = model1.doRetrieveByUser(utente.getIdUtente());
		
	%>

    <div id="container">
        <div id="main">
        <%@ include file = "../frammenti/loggedheader.jsp"%>
            <div class="regcontainer">
                <div class="middle" style="width: fit-content;">
                    <div class="title">
                        <h1>Area Personale</h1>
                    </div><br>
                    <div class="userareacontainer">
                        <div class="leftuser">
                            <div class="imgcontainer">
                                <img src="img/gamepad (1).png" alt="avatar">
                                <a href="LogoutServlet"><button>Esci</button></a>
                            </div>
                        </div>
                        <div class="rightuser">
                            <div class="userinfocontainer">
                                <h2>Dati utente</h2>
                                <div class="anagraficdata">
                                    <p>Nome: <span><%= utente.getNome() %> </span><span><%=utente.getCognome() %></span> Username: <span><%=utente.getUsername() %></span></p>
                                </div><br>
                                <div class="contactuser">
                                    <h2>Contatti</h2>
                                    <div class="contactu">
                                        <p>email: <span><%=utente.getEmail() %></span> Telefono: <span><%=utente.getTelefono() %></span></p>
                                    </div><br>
                                    <div class="addressuser">
                                        <h2>Indirizzi</h2>
                                        <p>Indirizzo: <span>via/Piazza: <%=utente.getVia() %></span>, <span>N° civico: <%=utente.getnCivico() %> </span>, <span>citta: <%=utente.getCitta() %></span>, <span>provincia: <%=utente.getProvincia() %></span>, <span>cap: <%=utente.getCap() %></span></p>
                                    </div>
                                </div><br>
                                <div class="paymentuser">
                                    <h2 style="margin-bottom:20px;">Metodi di pagamento</h2>
                                    <div class="creditcard">
                                    <%if(metodoP != null && metodoP.size()!=0){
										Iterator<?> it =metodoP.iterator();
											while(it.hasNext()){
									PaymentBean Paybean = (PaymentBean)it.next();%>
                                        <div class="chipcontainer">
                                            <img src="img/chip.png" alt="chip">
                                        </div>
                                        <div class="banklogo">
                                            <img src="img/banklogo.png" alt="banklogo">
                                        </div>
                                        <div class="numbercard">
                                            <p><%=Paybean.getNcarta() %></p>
                                        </div>
                                        <div class="expiresdate">
                                            <p>VALID<br>THRU<span><%=Paybean.getMeseScad() %>/<%=Paybean.getAnnoScad() %></span></p>
                                        </div>
                                        <div class="nomecontainer">
                                            <div class="name">
                                                <p ><%=utente.getNome() %> <%=utente.getCognome() %> </p>
                                            </div>
                                        </div>
                                        <div class="cvv">
                                            <p>CVV: <span><%=Paybean.getCvv() %></span></p>
                                        </div>
                                    </div>
                                    
                                   <%}} %>
                                </div>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%}else{	response.sendRedirect("index.jsp");%>
    <% }%>
    
</body>
</html>