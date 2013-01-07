$(document).ready(function() {
  $('#add_item').css('display','none');
  $("#restaurant_id").change(function () {
    $('#add_item').css('display','none');
    var restaurant_id = $(this).val();
    $('#order_item_id').html(" "); 
    if(restaurant_id != ""){
      $('#add_item').css('display','block');
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
      success: function(data) { 
        $("#new_item").html(data); 
        $('input#item_restaurant_id').val($("#restaurant_id option:selected").val());
        $("form#new_item input[type='submit']").click(function(){
          $("form#new_item").css('display', 'none');
        });
      },
      error: function(data) { alert("errror"); }
    });
  });
  $('#new_item').on('ajax:success', 'form', function(evt, element) {
    $('#order_item_id').append("<option selected='selected' value="+ element.id+">"+element.name+ " - " + element.price +"zł </option>");
  });

});

