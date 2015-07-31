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
  
      var username = gon.username
      var link = "https://api.geonames.org/findNearestAddressJSON?lat=" + latitude + "&lng=" + longitude + "&username=" + username
      
      $.getJSON(link)
      .done(function(data){
        var address = data.address.placename + ", " + data.address.postalcode
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