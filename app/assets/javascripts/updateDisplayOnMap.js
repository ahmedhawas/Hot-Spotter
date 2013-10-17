$(function(){
   $('.updateContainer').click( function() {
    var marker;
    var marker_location;
    var lat = parseFloat($(this).attr('data-lat')) + (Math.random() -.5) / 150000;
    var lng = $(this).attr('data-lng');
    
    var pos = new google.maps.LatLng(lat, lng);
    marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: "Update Location"
    });
    map.setCenter(pos);
    map.setZoom(16);
   });
});