var styles = [
	{
		featureType: 'water',
		elementType: 'all',
		stylers: [
			{ hue: '#0099FF' },
			{ saturation: 100 },
			{ lightness: -34 },
			{ visibility: 'on' }
		]
	},{
		featureType: 'landscape',
		elementType: 'all',
		stylers: [
			{ hue: '#00CC66' },
			{ saturation: 100 },
			{ lightness: -55 },
			{ visibility: 'on' }
		]
	},{
		featureType: 'road.highway',
		elementType: 'all',
		stylers: [
			{ hue: '#888888' },
			{ saturation: -100 },
			{ lightness: -17 },
			{ visibility: 'on' }
		]
	},{
		featureType: 'landscape',
		elementType: 'all',
		stylers: [
			{ hue: '#E8E8E8' },
			{ saturation: -100 },
			{ lightness: 18 },
			{ visibility: 'on' }
		]
	},{
		featureType: 'poi.park',
		elementType: 'all',
		stylers: [
			{ hue: '#00CC66' },
			{ saturation: 100 },
			{ lightness: -49 },
			{ visibility: 'on' }
		]
	}
];
var options = {
	mapTypeControlOptions: {
		mapTypeIds: [ 'Styled']
	},
	center: new google.maps.LatLng(43.651118278698014, -79.37737693786619),
	zoom: 14,
	mapTypeId: 'Styled'
};
var div = document.getElementById('map');
var map = new google.maps.Map(div, options);
var styledMapType = new google.maps.StyledMapType(styles, { name: 'Styled' });
map.mapTypes.set('Styled', styledMapType);
