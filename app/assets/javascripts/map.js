mapDragging = false;
defaultMapCenter = {lat:52.516412, lng:13.402964}; //default value

function update_map() {

		$.getJSON(baseURL() + 'map/get_position', function(position) {
			if(!mapDragging) {
				if(currentPositionId != position.id) {
					map.panTo(new google.maps.LatLng(position.lat, position.lng));
					currentPositionId = position.id;
				} 
			}
		});
}

function load_map() {	

	$.getJSON(baseURL() + 'map/get_position', function(position) {
	
		var mapCenter = {};
		if(!position) {
			mapCenter = defaultMapCenter;
		} else {
			mapCenter = position;
		}
	
	  var mapOptions = {
  	      zoom: 18,
          scrollwheel: false,
			    disableDoubleClickZoom: true,
					disableDefaultUI: true,
          center: new google.maps.LatLng(mapCenter.lat, mapCenter.lng),
          mapTypeId: google.maps.MapTypeId.SATELLITE
        };
	  map = new google.maps.Map(document.getElementById('map'), mapOptions);
		currentPositionId = position.id;
		
	  google.maps.event.addListener(map, 'dragstart', function() { mapDragging = true; });
	  google.maps.event.addListener(map, 'dragend', mapMoved);
	  setInterval("update_map()", 2000);
	});

	$(window).resize(resizeWindow);
}

function resizeWindow(event) {
	var minHeight = $('#content_container').height() + 100;
	if($(document).height() > minHeight) {
		$("#map").height($(document).height());
	} else {
		$("#map").height(minHeight);
	}
	google.maps.event.trigger(map, 'resize');
}

function mapMoved() {
	var center = map.getCenter();
	$.ajax({
   		type: "POST",
	    url: baseURL() + "map/update",
   		data: "lat=" + center.lat() + "&lng=" + center.lng(),
   		success: function(msg){
   			mapDragging = false;
   			//alert(msg);
   		},
   		error: function(XMLHttpRequest, textStatus, errorThrown) {
   			//alert('error');
   		}
 	});
}
