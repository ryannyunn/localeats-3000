$(function(){

  $(".about").on('click', function(){
    jumpToAbout();
  });

  function jumpToAbout(){
      $('html, body').animate({
          scrollTop: $("#about").offset().top
      }, 2000);
  };

  $("#location").on('click', function(){
    $("#search_near").val("Looking for your location...");
    navigator.geolocation.getCurrentPosition(function(position){
      var crd = position.coords;
      var latitude = crd.latitude;
      var longitude = crd.longitude;
      var ll = latitude + ',' + longitude;
      $("#search_ll").val(ll);
  
      var google_geocoder = gon.google_geocoder
      var link = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + ll + "&key=" + google_geocoder
      
      $.getJSON(link)
      .done(function(data){
        var address = data['results'][3]['formatted_address']
        $("#search_near").val(address);
      })
      .fail(function(){
      alert("Oops, we couldn't find your location. Please enter a neighborhood.");
      });
   });
 });

  $("form").submit(function(e){
    e.preventDefault();
    e.stopPropagation();    

    var fact = randomFact();
    var query = $("#search_query").val()
    
    $("#myModalLabel").html("Searching for locals' favorite " + query + " spots...")
    $('#myModal').children('div').children('div').children('div.modal-body').html("<h4>Did you Know?</h4><p>"+ fact +"</p>");
    $('#myModal').modal('show');

    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();

    $.ajax({
      method: method,
      url: url,
      data: data,
      dataType: 'script'
    });
  })
});