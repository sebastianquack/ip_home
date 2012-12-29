mapDragging = false;
defaultMapCenter = {lat:52.516412, lng:13.402964}; //default value

function update_map() {
		$.getJSON(baseURL() + 'map/get_position', function(position) {
			if(!mapDragging) {
				map.panTo(new google.maps.LatLng(position.lat, position.lng));
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
  	      zoom: 17,
          scrollwheel: false,
			    disableDoubleClickZoom: true,
					disableDefaultUI: true,
          center: new google.maps.LatLng(mapCenter.lat, mapCenter.lng),
          mapTypeId: google.maps.MapTypeId.SATELLITE
        };
	  map = new google.maps.Map(document.getElementById('map'), mapOptions);
	  google.maps.event.addListener(map, 'dragstart', function() { mapDragging = true; });
	  google.maps.event.addListener(map, 'dragend', mapMoved);

	  setInterval("update_map()", 2000);
	});

	resizeWindow();
	$(window).resize(resizeWindow);
}

function resizeWindow(event) {
	if($("#content_container").height() > $(window).height()) {
		$("#map").height($("#content_container").height() + 40);
		google.maps.event.trigger(map, 'resize');
	} else {
		$("#map").height($(window).height());
		google.maps.event.trigger(map, 'resize');
	}
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
