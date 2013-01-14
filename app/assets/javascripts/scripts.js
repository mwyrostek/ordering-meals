$(document).ready(function() {
	$('a#add_active').click(function(e){
		e.preventDefault();
		$("input[type=checkbox]:checked").each(function(){
		  console.log($(this).val());
		});
	});
	$('#datepicker').datepicker('show');
	$('#datepicker').datepicker().on('changeDate', function(ev){
    $.ajax({
      url: 'orders',
      data: {"date": ev.date},
      success: function(data){
        $('.orders_content').html(data);
	    }
	  }); 
  });
});