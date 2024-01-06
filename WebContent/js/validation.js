$(document)
		.ready(
				function() {

					$('#username').focus(function(e) {
						$('#errorPass1').css("display", "none");
					});
					$('#password').focus(function(e) {
						$('#errorPass2').css("display", "none");
					});

					var countError1 = 0;
					var countError2 = 0;
					var countError3 = 0;

					$('#submit')
							.click(
									function(e) {

										e.preventDefault();
										var user = $('#username').val();
										var pwd = $('#password').val();

										var userValid = /^[0-9a-zA-Z]+$/;

										if (!(user.match(userValid))
												&& countError1 < 1) {
											countError1 += 1;
											$('#errorPass1').show();

										}

										if (pwd.match("") && countError2 < 1) {
											countError2 += 1;
											$('#errorPass2').show();

										}

										if (user.match(userValid)) {
											
											$("#errorPass1").remove();
											$("#errorPass2").remove();
											$
													.ajax({
														url : 'UserLogServlet',
														type : 'Post',
														data : {
															user : user,
															pwd : pwd
														},
														success : function(
																result) {

															if (result == 'Ok') {
																$(location)
																		.attr(
																				'href',
																				'index.jsp');
															} else if (result == 'No'
																	&& countError3 < 1) {
																countError3 += 1;
																$("#password")
																		.after(
																				"<b><p id=erroreUtente style='color: red;'>Utente non trovato...Controlla username o password</p></b> <br>");
															}
														}

													});
										}
									});
				});