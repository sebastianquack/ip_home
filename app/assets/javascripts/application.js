// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.history.js
//= require_tree .

function reset_navigation_events() {
		$('#language_selector').unbind('change');
		$('#language_selector').change(function() {
				var new_locale = $('#language_selector').val();
				var base_url = window.location.protocol + '//' + window.location.host + '/';
				var new_url =  base_url + new_locale + window.location.pathname.substr(3);
				History.pushState(null, document.title, new_url);				
		});

		$('.nav_ajax').unbind('click');
		$('.nav_ajax').click(function(event) {
				  event.preventDefault();
					History.pushState(null, document.title, $(this).attr("href"));
		});
}

(function(window,undefined){

    // Prepare
    var History = window.History; // Note: We are using a capital H instead of a lower h

    if ( !History.enabled ) {
         // History.js is disabled for this browser.
         // This is because we can optionally choose to support HTML4 browsers or not.
        return false;
    }
    
    // Bind to StateChange Event
    History.Adapter.bind(window,'statechange',function(){ // Note: We are using statechange instead of popstate
        var State = History.getState(); // Note: We are using History.getState() instead of event.state
	        $('#main_content').load(State.url);        
					var base_url = window.location.protocol + '//' + window.location.host + '/';
					var new_locale = window.location.pathname.substr(1, 2);
      	  $('#main_navigation').load(base_url + 'navigation', {'locale': new_locale}, reset_navigation_events);
    });
    
})(window);

$(window).load(function() {
	reset_navigation_events();
});


