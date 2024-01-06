<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm1" action="EditItemServlet">
					<input type="hidden" name="action" value="edit-titolo">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
						<div class="mb-3">
							<label class="form-label" style="color:black;">Titolo</label>
							<input type="text" name="titolo" class="form-control" placeholder="<%=bean.getNome()%>">
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm1">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm2" action="EditItemServlet">
					<input type="hidden" name="action" value="edit-prezzo">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
						<div class="mb-3">
							<label class="form-label" style="color:black;">Prezzo</label>

							<input type="number" step="0.01" name="prezzo" class="form-control" placeholder="<%=bean.getPrezzo()%>">

							
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm2">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="myModal3">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm3" action="EditItemServlet">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
					<input type="hidden" name="action" value="edit-iva">
						<div class="mb-3">
							<label class="form-label" style="color:black;">IVA</label>
							<input type="number" name="iva" class="form-control" placeholder="<%=bean.getIva()%>">
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm3">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="myModal4">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="post" id="myForm4" action="EditItemServlet">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
					<input type="hidden" name="action" value="edit-descrizione">
						<div class="mb-3">
							<label class="form-label" style="color:black;">Descrizione</label>
							<textarea  class="form-control" name="descr" placeholder="<%=bean.getDescr()%>"></textarea>
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm4">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal" id="myModal5">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm5" action="EditItemServlet">
					<input type="hidden" name="action" value="edit-quant">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
						<div class="mb-3">
							<label class="form-label" style="color:black;">Quantità</label>
							<input type="number" name="quant" class="form-control" placeholder="<%=bean.getQuanTot()%>">
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm5">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="myModal6">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modifica Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm6" action="EditItemServlet">
					<input type="hidden" name="action" value="edit-genere">
					<input type="hidden" name="idBean" value="<%=bean.getId()%>">
						<div class="mb-3">
							<label class="form-label" style="color:black;">Genere</label>
							<label class="form-label" style="color:black;">Attuale: <%=bean.getGenere() %></label><br><br>
							
							<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="generes" id="inlineRadio1" value="Arcade">
								  <label class="form-check-label" for="Arcade" style="color:black;">Arcade</label>
								</div>
								<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="generes" id="inlineRadio2" value="RPG">
								  <label class="form-check-label" for="RPG" style="color:black;">RPG</label>
							</div>
							
							<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="generes" id="inlineRadio2" value="Avventura">
								  <label class="form-check-label" for="Avventura" style="color:black;">Avventura</label>
							</div>
							
							<div class="form-check form-check-inline">
								  <input class="form-check-input" type="radio" name="generes" id="inlineRadio2" value="Azione">
								  <label class="form-check-label" for="Azione" style="color:black;">Azione</label>
							</div>
							
						</div>
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Modifica" form="myForm6">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>

		<div class="modal" id="myModal7">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Elimina Prodotto</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<div class="modal-body">
				
					<form method="get" id="myForm7" action="AdminServlet2" >
					<input type="hidden" name="action" value="removeFromDB">
					<input type="hidden" name="IdBean" value="<%=bean.getId()%>">
						<div class="mb-3">
							<label class="form-label" style="color:black;">SICURO DI VOLER ELIMINARE</label>
							<h4 style="color:black;"><%=bean.getNome()%>?</h4>
						</div>
						
						
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Elimina" form="myForm7">
						</div>
						
					</form>
												
				</div>
			</div>
		</div>
	</div>
</body>
</html>