$(function(){
   $('.updateContainer').click( function() {
    var marker;
    var marker_location;
    var lat = $(this).attr('data-lat');
    var lng = $(this).attr('data-lng');
    
    toggle
    var pos = new google.maps.LatLng(lat, lng);
    marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: "Update Location"
    });

   });
});



