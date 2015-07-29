$(function(){
  $("#display_location").hide();
  $(".whirly-loader").hide();
  $("#location").on('click', function(){
    $(".whirly-loader").show();
    navigator.geolocation.getCurrentPosition(function(position){
      var crd = position.coords;
      var latitude = crd.latitude;
      var longitude = crd.longitude;
      var ll = latitude + ',' + longitude;
      $("#search_ll").val(ll);
      var username = gon.username
      var link = "http://api.geonames.org/findNearestAddressJSON?lat=" + latitude + "&lng=" + longitude + "&username=" + username
      $.getJSON(link)
      .done(function(data){
        $(".whirly-loader").hide();
        var address = "<p> It seems like you're in: "+ data.address.placename + ", " + data.address.postalcode + "</p>"
        
        $("#display_location").html(address)
        $("#display_location").show()
        
      })
      .fail(function(){
      alert("Oops, we couldn't find your location, please enter a neighborhood");
      });
   });
 });

 //on form.submit function 
 //clear flash
 // serialize array
 // get form info 
 //make ajax call 

 // $("form").submit(function(){
 //  $('div.flash').html('')
 //  debugger;

 //  $.ajax({

 //  })
 // })


});