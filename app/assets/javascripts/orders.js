 $(document).ready(function() {
    $("#restaurant_id").change(function () {
        var restaurant_id = $(this).val();
        $('#order_item_id').html(" "); 
        if(restaurant_id != ""){
          var path = "/restaurants/" + restaurant_id + ".json";
          $.ajax({
            url: path,
            dataType: "json",
            type: "GET",
            processData: false,
            contentType: "application/json", 
            success: function(data){
              $.each(data, function(index, element){
                $('#order_item_id').append("<option value="+ element.id+">"+element.name+ " - " + element.price +"zł </option>");
              });
            }
          });
        }        
    });

  $('#add_item').click(function (){
$.ajax({
url: '/items/new',
data: $('form#new_item').serialize(),
success: function(data) { $("#new_item").html(data); },
error: function(data) { alert("errror"); }
});
  });
});