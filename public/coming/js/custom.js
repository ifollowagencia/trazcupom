(function($) {
	"use strict";
/*----Countdown----*/
	$('#timer').countdown('2014/01/31') // Set as YYYY/MM/DD or YYYY/MM/DD HH:MM:SS
	.on('update.countdown', function(event) {
      	$('#day-cd').html(event.strftime('%-D'));
	  	$('#hour-cd').html(event.strftime('%H'));
	  	$('#minute-cd').html(event.strftime('%M'));
	  	$('#second-cd').html(event.strftime('%S'));
 	 })
	.on('finish.countdown',function(event_){
		$('#day-cd').html('0');
	  	$('#hour-cd').html('00');
	  	$('#minute-cd').html('00');
	  	$('#second-cd').html('00');
		$("#percent-cd").attr("100")	
	});
/*----Slider background----*/

/*----MailChimp----*/		
	$('#mc-form').ajaxChimp({
		url: 'http://kevin-li.us3.list-manage.com/subscribe/post?u=797f74ae14a1b9d82c87f1f08&amp;id=b917141538' // Replace this url with your MailChimp List API
	});
/*----Google Map----*/	
	$('#map-section').gmap3({
	 map: {
		options: {
		 center: [-33, 151],// the view coordinate
		 maxZoom: 8	,		// the initial zoom multiple
		 scrollwheel: false,
		}
	 },
	 marker:{
		latLng:[-33, 151]	// the marker coordinate
	 }
	},
	"autofit" );
})(jQuery);