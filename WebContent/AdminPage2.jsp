
    
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.model.javabeans.*"%>
    
    	<% 	Collection<?> articoli = (Collection<?>) request.getAttribute("articoli");
		Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
		Collection<?> ordini2 = (Collection<?>) request.getAttribute("ordiniPerData");
		Collection<?> ordini3 = (Collection<?>) request.getAttribute("ordiniPerCliente");
		%>
		
		
		
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap css -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  

<link rel="icon" type="image/x-icon" href="img/faviconTitle.ico">

<title>Game Over</title>
</head>
<body style="background-color:rgb(77,77,77)">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<h3 style="text-align: center; margin-top: 40px; font-weight:bold;color:white;">Visualizza Articoli</h3>
<div class="table-responsive" >
<table class="table table-dark table-striped " >
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Immagine</th>
      <th scope="col">Titolo</th>
      <th scope="col">Prezzo</th>
      <th scope="col">Iva</th>
      <th scope="col" >Descrizione</th>
      <th scope="col">Quantità</th>
	  <th scope="col">Disponibilità</th>
	  <th scope="col">Genere</th>
      
    </tr>
    
    <% if(articoli != null && articoli.size()!=0){
		
		Iterator<?> it =articoli.iterator();
		while(it.hasNext()){
		ProductBean bean = (ProductBean)it.next();	
		
		%>
  </thead>
  <tbody>
    <tr class="giochi">
		<td><%=bean.getId() %></td>
		<td><a href="ProductsServlet?action=dettagli&id=<%=bean.getId()%> "><img style="border-radius:15px;"src="./img/<%= bean.getImg().substring(bean.getImg().lastIndexOf("img")+4)%>"></a></td>
		<td><%=bean.getNome() %></td>
		<td><%=bean.getPrezzo() %></td>
		<td><%=bean.getIva() %></td>
		
		<td style="color:black;">
		
  		<button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
    		Mostra
  		</button>
		
		<div style="min-height: 120px;">
  			<div class="collapse collapse-horizontal" id="collapseWidthExample">
   			 <div class="card card-body" style="width: 300px;">
      <%=bean.getDescr()%>
    </div>
  </div>
</div>
		
		
		</td>
		<td><%=bean.getQuanTot() %></td>
		<td><%=bean.getDisp() %></td>
		<td><%=bean.getGenere() %></td> 
	</tr>
  </tbody>
  <%}} %>
</table>
</div><br>


<h3 style="text-align: center; margin-top: 40px; font-weight:bold;color:white;">Visualizza Ordini Complessivi</h3>
<div class="table-responsive" >
<table class="table table-dark table-striped " >
	<thead>
    <tr>
		<th>Id Ordine</th>
		<th>Id Pagamento</th>
		<th>Id Utente</th>
		<th>Importo Totale</th>
		<th>Stato ordine</th>
		<th>Data Ordine</th>
		<th>Data Spedizione</th>
		
	</tr>
</thead>
		<% if(ordini != null && ordini.size()!=0){
		
		Iterator<?> it =ordini.iterator();
		while(it.hasNext()){
		OrderBean bean1 = (OrderBean)it.next();	
		
		%>
	<tbody>
	
	<tr class="giochi2">
		<td><%=bean1.getIdOrdine() %></td>
		<td><%=bean1.getIdPagamento() %></td>
		<td><%=bean1.getIdUtente() %></td>
		<td><%=bean1.getImportoTotale() %></td>
		<td><%=bean1.getStatoOrdine() %></td>
		<td><%=bean1.getDataAcquisto()%></td>
		<td><%=bean1.getDataSpedizione()%></td>
		
		</tr>
	</tbody>
<%}}
		%>

</table>
</div><br><br><br>


<h3 ><a class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthEx" aria-expanded="false" aria-controls="collapseWidthEx">
    		Inserimento Articoli
  		</a></h3>
		
		<div style="min-height: 120px;">
  			<div class="collapse collapse-horizontal" id="collapseWidthEx">
   			 <div class="card card-body" style="width: 500px;background-color:#212529">
      <form method="post" id="my_form" action="AdminServlet2" enctype="multipart/form-data">
<input type="hidden" name="action" value="insert">
<table>
    <tr>
        <td>
      		
            <input type="text" name="Titolo_Gioco" form="my_form" placeholder="Titolo Gioco"/>
            <input type="text" name="Prezzo" form="my_form" placeholder="Prezzo"/>
            <input type="text" name="IVA" form="my_form" placeholder="IVA"/>
            <input type="text" name="descrizione" form="my_form" placeholder="Descrizione"/>
            <input type="number" name="Quantita" form="my_form" placeholder="Quantità Totale"/>
            <input type="text" name="Disponibilita" form="my_form" placeholder="Disponibilità (SI/NO)"/><br><br>
            
            <h4 style="color:white;">PIATTAFORMA</h4>
            <input type="radio" value="Xbox" name="platform"/>
             <label for="Xbox" style="color:white;">Xbox</label><br>
            <input type="radio" value="Pc" name="platform"/>
             <label for="Pc" style="color:white;">Pc</label><br>
            <input type="radio" value="Nintendo Switch" name="platform"/>
             <label for="Nintendo" style="color:white;">Nintendo</label><br>
            <input type="radio" value="Ps5" name="platform"/>
             <label for="Ps5" style="color:white;">Ps5</label><br><br>
             
             <h4 style="color:white;">GENERE</h4>
             <input type="radio" value="Arcade" name="generes"/>
             <label for="Arcade" style="color:white;">Arcade</label><br>
            <input type="radio" value="Avventura" name="generes"/>
             <label for="Avventura" style="color:white;">Avventura</label><br>
            <input type="radio" value="Azione" name="generes"/>
             <label for="Azione" style="color:white;">Azione</label><br>
            <input type="radio" value="RPG" name="generes"/>
             <label for="RPG" style="color:white;">RPG</label><br><br>
             
            <input type="file" name="image"/>
            <input type="submit" value="Aggiungi Gioco" class="btn btn-primary"form="my_form"/>
            <input type="reset" value="Annulla" class="btn btn-danger" /><br><br>
        </td>
    </tr>
</table>
</form>
    </div>
  </div>
</div>



<button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExam" aria-expanded="false" aria-controls="collapseWidthExam">
    		Ricerca Ordini per Data
  		</button>
		
		<div style="min-height: 120px;">
  			<div class="collapse collapse-horizontal" id="collapseWidthExam">
   			 <div class="card card-body" style="width: 350px; background-color:#212529">
      <form method="GET" id=my_form2 action="AdminServlet2">
			<input type="hidden" name="action" value="searchByDate">
			<input type="date" name="DataInizio" form="my_form2" style="height:37.5px">
			<input type="date" name="DataFine" form="my_form2" style="height:37.5px">
			<input type="submit" value="Cerca" form="my_form2" class="btn btn-primary">
</form>
    </div>
  </div>
</div>


<button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExa" aria-expanded="false" aria-controls="collapseWidthExa">
    		Ricerca Ordini per Cliente
  		</button>
		
		<div style="min-height: 120px;">
  			<div class="collapse collapse-horizontal" id="collapseWidthExa">
   			 <div class="card card-body" style="width: 350px; background-color:#212529">
      <form method="get" id=my_form3 action="AdminServlet2">
			<input type="text" name="Cliente" placeholder="Cliente" form="my_form3" style="height:37.5px">
			<input type="hidden" name="action" value="searchByUser">
			<input type="submit" value="Cerca" form="my_form3" class="btn btn-danger">
</form>
    </div>
  </div>
</div>


<h3 style="text-align:center;font-weight:bold;color:white;">Visualizza Ordini</h3>
	<div class="table-responsive" >
	<table class="table table-dark table-striped " >
	<thead>
    
	<tr>
		<th>Id Ordine</th>
		<th>Id Pagamento</th>
		<th>Id Utente</th>
		<th>Importo Totale</th>
		<th>Stato ordine</th>
		<th>Data Ordine</th>
		<th>Data Spedizione</th>
		
	</tr>
	</thead>

		<% if(ordini2 != null && ordini2.size()!=0){
		
		Iterator<?> it =ordini2.iterator();
		while(it.hasNext()){
		OrderBean bean1 = (OrderBean)it.next();	
		
		%>
	
	
	<tr class="giochi3">
		<td><%=bean1.getIdOrdine() %></td>
		<td><%=bean1.getIdPagamento() %></td>
		<td><%=bean1.getIdUtente() %></td>
		<td><%=bean1.getImportoTotale() %></td>
		<td><%=bean1.getStatoOrdine() %></td>
		<td><%=bean1.getDataAcquisto()%></td>
		<td><%=bean1.getDataSpedizione()%></td>
		
		</tr>
	
<%}} else if(ordini3 != null && ordini3.size()!=0){
	
	Iterator<?> it =ordini3.iterator();
	while(it.hasNext()){
	OrderBean bean1 = (OrderBean)it.next();	
		%>
			
	<tr class="giochi3">
		<td><%=bean1.getIdOrdine() %></td>
		<td><%=bean1.getIdPagamento() %></td>
		<td><%=bean1.getIdUtente() %></td>
		<td><%=bean1.getImportoTotale() %></td>
		<td><%=bean1.getStatoOrdine() %></td>
		<td><%=bean1.getDataAcquisto()%></td>
		<td><%=bean1.getDataSpedizione()%></td>
		
		</tr>
	
<%}}%>

</table>
</div>
</body>
</html>