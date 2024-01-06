

$(document).ready(function(){
			
	var errNome=0;
	var errCogn=0;
	var errEmail=0;
	var errPassword=0;
	var errTelefono=0;
	var errUsername=0;
	var errVia=0;
	var errCap=0;
	var errCitta=0;
	var errCivico=0;
	var errProvincia=0;
	var errNumeroCarta=0;
	var errAnno=0;
	var errMese=0;
	
					$('#name').focus(function(e){
							
						$('#errorname').css("display", "none");
						
					});
					
					$('#surname').focus(function(e){
						
						$('#errorsurname').css("display", "none");
						
					});
					
					$('#username').focus(function(e){
						
						$('#errorusername').css("display", "none");
						
					});
					
					$('#password').focus(function(e){
						
						$('#errorpassword').css("display", "none");
						
					});
					
					$('#email').focus(function(e){
						
						$('#errorname').css("display", "none");
						
					});
					
					$('#via').focus(function(e){
						
						$('#errorvia').css("display", "none");
						
					});

					$('#civico').focus(function(e){
						
						$('#errorcivico').css("display", "none");
						
					});

					$('#citta').focus(function(e){
						
						$('#errorcitta').css("display", "none");
						
					});

					$('#provincia').focus(function(e){
						
						$('#errorprovincia').css("display", "none");
						
					});
					
					$('#cap').focus(function(e){
						
						$('#errorcap').css("display", "none");
						
					});

					$('#ncarta').focus(function(e){
						
						$('#errorncarta').css("display", "none");
						
					});

					$('#scadenzamese').focus(function(e){
						
						$('#errormese').css("display", "none");
						
					});
					
					$('#scadenzaanno').focus(function(e){
						
						$('#erroranno').css("display", "none");
						
					});
					
					$('#telefono').focus(function(e){
						
						$('#errortel').css("display", "none");
						
					});
					
					
					
					$('#submit').click(function(e){
						
					e.preventDefault();
					var nome = $('#name').val();
                    var cognome = $('#surname').val();
                    var username = $('#username').val();
                    var password = $('#password').val();
                    var email = $('#email').val();
                    var telefono = $('#telefono').val();
                    var via = $('#via').val();
                    var civico = $('#civico').val();
                    var citta = $('#citta').val();
                    var provincia = $('#provincia').val();
                    var cap = $('#cap').val();
                    var numeroCarta = $('#ncarta').val();
                    var scadenzaMese = $('#scadenzamese').val();
                    var scadenzaAnno = $('#scadenzaanno').val();
                    var cvv= $('#cvv').val();

                    var validNameSurUser= /^[A-Za-z]+$/;
                    var validUsername = /^[0-9a-zA-Z]+$/;
                    var validEmail = /^([a-z1-9.-])*@([a-z])+(.com)$/;
                    var validPhone =  /^\d{10}$/;
                    var validNcarta =  /^\d{16}$/;
                    var validVia=/^[A-Za-z0-9\W]+$/;
                    var validCitta= /^[A-Za-z]+$/;
                    var validProvincia = /^[A-Za-z]+$/;
                    var validCivico= /^[0-9]$/;
                    var validCap= /^([0-9]{5})$/;
                    
                    

                    if(!(nome.match(validNameSurUser)) && errNome < 1){
                        errNome +=1;
                        $('#errorname').show();
                    }
                    
                    if(!(cognome.match(validNameSurUser)) && errCogn < 1){
                        errCogn +=1;
                        $('#errorsurname').show();
                    }
                    
                    if(!(username.match(validUsername)) && errUsername < 1){
                        errUsername +=1;
                        $('#errorusername').show();
                    }
                    
                    if(!(email.match(validEmail))&& errEmail < 1){
                    	errEmail +=1;
                    	$('#erroremail').show();
                    }
                    
                    if(!(telefono.match(validPhone)) && errTelefono < 1){
                    	errTelefono +=1;
                    	$('#errortel').show();
                    }
                    
                    if(!(via.match(validVia))&& errVia < 1){
                    	errVia +=1;
                    	$('#errorvia').show();
                    }
                    	
                    if(!(citta.match(validCitta)) && errCitta < 1){
                    	errCitta +=1;
                    	$('#errorcitta').show();
                    }
                    
                    if(!(provincia.match(validProvincia)) && errProvincia < 1){
                    	errProvincia += 1;
                    	$('#errorprovincia').show();
                    }
                    
                 /*Lo rimuovo perchè non tutti hanno un numero civico
                 *    if(!(civico.match(validCivico))&& errCivico <1){
                    	errCivico +=1;
                    	$('#errorcivico').show();
                    	
				}*/
                    
                    if(!(cap.match(validCap))&& errCap < 1){
                    	errCap +=1;
                    	$('#errorcap').show();
                    }
                    
                    if(!(numeroCarta.match(validNcarta))&& errNumeroCarta <1){
                    	errNumeroCarta +=1;
                    	$('#errorncarta').show();
                    }
                    
                    
                    
                    if((nome.match(validNameSurUser)) && (cognome.match(validNameSurUser)) && (username.match(validUsername)) && (email.match(validEmail)) && (telefono.match(validPhone)) && (via.match(validVia)) && (citta.match(validCitta)) && (provincia.match(validProvincia)) && (cap.match(validCap)) && (numeroCarta.match(validNcarta))){
                    	$.ajax({
                    		type: 'POST',
                    		data: {nome: nome , cognome: cognome, user:username , pwd: password, email: email, telefono: telefono, via: via , citta: citta, provincia: provincia , cap:cap , civico: civico, ncarta: numeroCarta,mesescadenza: scadenzaMese, annoscadenza: scadenzaAnno, cvv:cvv },
                    		url: 'UserSignupServlet',
                    		success: function(result){
                    			if(result == 'Ok'){
                    				$(location)
									.attr(
											'href',
											'index.jsp');
                    			}
                    		}
                    		
                    	});
                    }
						
					});
					
	
});