$(function(){
	var toggle = 0;

	$('.updateContainer').click( function() {
		var lat = $(this).attr('data-lat');
	 	var lng = $(this).attr('data-lng');
	 	
 		var pos = new google.maps.LatLng(lat, lng);

 		if (toggle == 0){
		 	updateMarker = new google.maps.Marker({
	        position: pos,
	        map: map,
	        title: "Update Location"
	      	});
	      	toggle = 1;
	      	updateMarker.set("id", "ABC");
	 	}
	 	else{
	 		console.log('does it enter the setmap null?');
	 		console.log('marker id' + updateMarker.id);
	 		updateMarker.setMap(null);
	 		toggle = 0;
	 	}
	});

)};