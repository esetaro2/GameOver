/**
 * 
 */

$(document).ready(function(){
			
		$('#submit').click(function(e){
			e.preventDefault();
			var search = $('#searchBar').val();

				if(search == ''){
					
				}else{
				$.ajax({
					type: 'Post',
					url:"SearchBarServlet",
					data:{searchBar : search},
					success:function(data){
						
						if(data == 'Ok'){$(location)
						.attr(
								'href',
								'provaSearch.jsp');
						}
					}
					
				});
				
				}
			
		});
	
});