// $(function(){
	function addUpdateMarker(){
	var toggle = 0;

	$('.updateContainer').click( function() {
		var lat = $(this).attr('data-lat');
	 	var lng = $(this).attr('data-lng');
	 	var markerImg = $(this).attr('data-img');
	 	
 		var pos = new google.maps.LatLng(lat, lng);

 		if (toggle == 0){
 			console.log(markerImg);
		 	updateMarker = new google.maps.Marker({
	        position: pos,
	        map: map,
	        title: "Update Location",
	        icon: markerImg
	      	});
	      	toggle = 1;
	      	map.setCenter(pos);
	      	map.setZoom(16);
	 	}
	 	else{
	 		updateMarker.setMap(null);
	 		toggle = 0;
	 	}
	});
	};
// )};