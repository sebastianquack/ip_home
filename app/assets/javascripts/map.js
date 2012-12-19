var map;
var mapCenter = {lat:52.516412, lng:13.402964}; //default value
var mapDragging = false;
var localMode = false;

function load_map() {	
  var mapOptions = {
          zoom: 17,
          scrollwheel: false,
			    disableDoubleClickZoom: true,
					disableDefaultUI: true,
          center: new google.maps.LatLng(mapCenter.lat, mapCenter.lng),
          mapTypeId: google.maps.MapTypeId.SATELLITE
        };

  map = new google.maps.Map(document.getElementById('map'), mapOptions);
	resizeWindow();
	$(window).resize(resizeWindow);

 	google.maps.event.addListener(map, 'dragstart', function() { mapDragging = true; });
 	google.maps.event.addListener(map, 'dragend', mapMoved);
}

function resizeWindow(event) {
	if(($("#content-container").height() + 200) > $(window).height()) {
		$("#map").height($("#content-container").height() + 200);
	} else {
		$("#map").height($(window).height());
	}
}

function mapMoved() {
	alert('mapMoved');
	/*
	var center = map.getCenter();
	$.ajax({
   		type: "POST",
	    url: baseURL + "mmomap/set_map_location.php",
   		data: "lat=" + center.lat() + "&lng=" + center.lng(),
   		success: function(msg){
     		mapDragging = false;
   		},
   		error: function(XMLHttpRequest, textStatus, errorThrown) {
   			//alert('error');
   		}
 	});
 	*/
}
