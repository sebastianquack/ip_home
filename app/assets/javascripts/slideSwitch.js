// Simple jQuery Slideshow
// By <a href="http://jonraasch.com/blog/">Jon Raasch</a>
function slideSwitch() {
	if($('#slideshow').html()) {
		
		var $active = $('#slideshow img.active');	
		if ($active.length == 0) $active = $('#slideshow img:first');
		//alert($active.html());	
		//use this to pull the images in the order they appear in the markup
		var $next =  $active.next().length ? $active.next() : $('#slideshow img:first');

		//alert($next.html());		
		// uncomment the 3 lines below to pull the images in random order
		// var $sibs  = $active.siblings();
		// var rndNum = Math.floor(Math.random() * $sibs.length );
		// var $next  = $( $sibs[ rndNum ] );
	
		$active.addClass('last-active').animate({opacity: 0.0}, 1000);
	
		$next.css({opacity: 0.0})
			.addClass('active')
			.animate({opacity: 1.0}, 1000, function() {
				$active.removeClass('active last-active');
			}
		);
	}
}
