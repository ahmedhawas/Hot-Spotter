function codeAddress() {
    geocoder = new google.maps.Geocoder();
    var address = document.getElementById('addressInput').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
  } else {
    alert('Geocode was not successful for the following reason: ' + status);
  }
});
}