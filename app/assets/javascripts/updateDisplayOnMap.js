$(function(){
	$('.updateContainer').click( function() {

		var lat = $(this).attr('data-lat');
	 	var lng = $(this).attr('data-lng');
	 	
 		var pos = new google.maps.LatLng(lat, lng);
	 	marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: "Update Location"
      	});

		$( ".target" ).toggle();
	});

)};


	 // $('.updateContainer').click( function() {
	 // 	var marker;
	 // 	var marker_location;
	 // 	var lat = $(this).attr('data-lat');
	 // 	var lng = $(this).attr('data-lng');
	 	

	 // 	if (typeof marker_location === 'undefined'){
	 // 		console.log('Marker1' + marker);
  //     		console.log('marker_location1' + marker_location);
	 // 		var pos = new google.maps.LatLng(lat, lng);
		//  	marker = new google.maps.Marker({
	 //        position: pos,
	 //        map: map,
	 //        title: "Update Location"
	 //      	});
  //     		// marker.setMap(map);
  //     		marker_location = [lat, lng];      
	
      		
  //     		console.log('marker_location' + marker_location);
  //     	}
  //     	else{
  //     		console.log('Marker' + marker);
  //     		console.log('marker_location' + marker_location);
  //     		marker.setMap(null);
  //     		marker_location = [];
  //     	};
	 // });

