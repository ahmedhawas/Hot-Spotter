 if (navigator.geolocation) {
      var timeoutVal = 10 * 1000 * 1000;
      navigator.geolocation.getCurrentPosition(
        displayPosition,
        displayError,
        { enableHighAccuracy: true, timeout: timeoutVal, maximumAge: 0 }
      );
    }
    else{
      alert("Geolocation is not supported by this browser");
    }
    function displayPosition(position) {
      var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      var options = {
        zoom: 16,
        center: pos,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("googleMap"), options);
      var marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: "Current Location"
      });
      var contentString = "<br/><b>Current location:</b> lat " + position.coords.latitude + ", long " + position.coords.longitude;
      var infowindow = new google.maps.InfoWindow({
        content: contentString
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });

      var heatmapData = generateRandomData();
       var heatmap = new google.maps.visualization.HeatmapLayer({
        data: heatmapData
      });
      heatmap.setMap(map);
    }
    function displayError(error) {
      var errors = {
        1: 'Permission denied',
        2: 'Position unavailable',
        3: 'Request timeout'
      };
      alert("Error: " + errors[error.code]);
    }


    function getRandomInRange(from, to, fixed) {
      return (Math.random() * (to - from) + from).toFixed(fixed) * 1;
    }
    function generateRandomData() {
      var heatData = new Array(100000);
      for (var i = 0; i < heatData.length; i++){
        lat = getRandomInRange(43.645527, 43.660527, 4);
        lon = getRandomInRange(-79.390961, -79.372961, 4);
        heatData[i] = new google.maps.LatLng(lat,lon);
      }
      return heatData;
    }
