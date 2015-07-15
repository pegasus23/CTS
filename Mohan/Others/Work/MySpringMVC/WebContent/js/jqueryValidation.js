/**
 * 
 */
 $(function() {
    $( "#tabs" ).tabs();
  });
 
 
 $(document).ready(function()
 {
	 $("#search").click(function()
			 {
		 		$.get('/MySpringMVC'+'/getAjaxData',function(data,status){
		 			alert('ajaxcall');
		 			/*$.each(data.Name,function(index,value)
		 					{
		 						alert(index+" "+value)
		 					});*/
		 			
		 			displyGridList(data.Name);
		 		});
			 });
 });
 
 
 
 function displyGridList(gridData){
		alert(gridData);
		
		$('#suggestname').jdataTable({
				jsondata:gridData,
				itemsPerPage:2,
				header:{
					by:['userName','designation'],
					titles:['Name','Designation'],
					sort:['string','string']
				},
			pagination:true
		});	
		
	}