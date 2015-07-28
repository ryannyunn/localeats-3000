$(function(){
  $("#display_location").hide();
  $("#location").on('click', function(){
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
        debugger;
        var address = "<p> It seems like you're in: "+ data.address.placename + ", " + data.address.postalcode + "</p>"
        
        $("#display_location").html(address)
        $("#display_location").show()
        
      })
      .fail(function(){
      alert("Oops, we couldn't find your location, please enter a neighborhood");
      });
   });
 });


});