$(function(){
 $("#location").on('click', function(){
   navigator.geolocation.getCurrentPosition(function(position){
     var crd = position.coords;
     var latitude = crd.latitude;
     var longitude = crd.longitude;
     var ll = latitude + ',' + longitude;
     $("#search_ll").val(ll);
     alert('im done');
   });
 });
});