// $(function(){
	function addUpdateMarker(){
	toggle = 0;
    console.log(toggle);

	$('.updateContainer').click( function() {
		var lat = $(this).attr('data-lat');
	 	var lng = $(this).attr('data-lng');
	 	var markerImg = $(this).attr('data-img');
 		var pos = new google.maps.LatLng(lat, lng);
        // console.log(toggle);

 		if (toggle == 0)
        {
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
	 	else 
	 	{
            //console.log(toggle);
            //updateMarker.setMap(null);	    
	 		toggle = 0;
	 	}
	});
	};
// });