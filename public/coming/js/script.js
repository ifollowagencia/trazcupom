(function($) {
	"use strict";	
	$(document).ready(function() {
		var win_h=$(window).height(),
			win_w=$(window).width()
	/*------Animates------*/		
		$("#scroll-down").click(function(){
			$.scrollTo('#about-section', 800 );
		});
	/*------Inview Animates------*/
	if(win_w>769){
		$(".about-us").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated bounceIn");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated bounceIn");
			  }
		});
		$(".about-item.the1st").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated fadeInLeft");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated fadeInLeft");
			  }
		});
		$(".about-item.the2nd").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated fadeInUp");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated fadeInUp");
			  }
		});
		$(".about-item.the3rd").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated fadeInRight");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated fadeInRight");
			  }
		});
		$(".get-updates h1").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated bounceIn");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated bounceIn");
			  }
		});
		$("#mc_embed_signup").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated flipInX");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated flipInX");
			  }
		});
		$(".sns-icon").bind('inview', function (event, visible) {
			  if (visible == true) {
				$(this).addClass("animated fadeInDown");// element is now visible in the viewport
			  } else {
				//$(this).removeClass("animated fadeInDown");
			  }
		});
	};	
	/*------Draw sth. & Position Reset------*/	
		function class_vertical_center(the_class){
				$the_target = $('.' + the_class);			
				$the_target.each(function(){
					target=$(this);
					p_top=(win_h - target.height() - 0 ) / 2;
					if (p_top > 0) target.css({
						"padding-top": p_top
					});
					else target.css({
						"padding-top": 10
					})
				});
		 };
		 function id_vertical_center(the_id){
				$the_target = $('#' + the_id);			  		    
				target=$($the_target);
				m_top=(win_h - target.height() - 0 ) / 2 -50;
				if (m_top > 0) target.css({
					"margin-top": m_top
				});
				else target.css({
					"margin-top": 30
					
				});
		 };	 
		 function id_horizon_center(the_id){
				var win_w=$(window).width();
				var $the_target = $('#' + the_id);			  		    
				var target=$($the_target);
				var m_left=(win_w - target.width() - 0 ) / 2;
				if (m_left > 0) target.css({
					"left": m_left
				});
				else target.css({
					"left": m_left
					
				});
		 };	 
 
		 function id_full_height(the_id){
				$the_target = $('#' + the_id);			  		    
				var target=$($the_target);
				$the_target.height(win_h);
		 };
		 function id_70_height(the_id){
				var win_h=$(window).height();
				var $the_target = $('#' + the_id);			  		    
				var target=$($the_target);
				$the_target.height(.7*win_h);
		 };
		 function count_position(){
				var win_h=$(window).height();
				var win_w=$(window).width();
				if(win_w<769){
					var mtop=($(window).height() - $(".countdown").height()) / 2 -10;
				}else{
					var mtop=($(window).height() - $(".countdown").height()) / 2 -50;
				}
				$("#countdown-section").css({"top": mtop + "px"});
		 }
		 function count_move(){
				var win_h=$(window).height();
				var win_w=$(window).width();
				if(win_w<769){
					var mtop=($(window).height() - $(".countdown").height()) / 2 -10;
				}else{
					var mtop=($(window).height() - $(".countdown").height()) / 2 -50;
				}
				var margin = Math.round(mtop - $(window).scrollTop() / 4);
				var opacity = Math.round((1 - 2 / $(window).height() * $(window).scrollTop()) * 100) / 100;
				$("#countdown-section").css({"top": margin + "px", "opacity": opacity >= 0 ? opacity : 0});	
		 }
		$(window).bind("load scroll", function (event) {
				var win_h=$(window).height();
				var win_w=$(window).width();
				if(win_w<769){
					var mtop=($(window).height() - $(".countdown").height()) / 2 -10;
				}else{
					var mtop=($(window).height() - $(".countdown").height()) / 2 -50;
				}
				var margin = Math.round(mtop - $(window).scrollTop() / 4);
				var opacity = Math.round((1 - 2 / $(window).height() * $(window).scrollTop()) * 100) / 100;
				$("#about-section").css({"margin-top": win_h + "px"});
				$("#countdown-section").css({"top": margin + "px", "opacity": opacity >= 0 ? opacity : 0});			
				$("#scroll-down").css({"opacity": opacity >= 0 ? opacity : 0});
				id_horizon_center('scroll-down');
				$("#about-section").css({"margin-top": win_h + "px"});
		});	
		$(window).resize(function () {
				var win_h=$(window).height();
				id_70_height('map-section');
				id_horizon_center('scroll-down');
				$("#about-section").css({"margin-top": win_h + "px"});
				count_move();
		});	
		id_70_height('map-section');
		$("#about-section").css({"margin-top": win_h + "px"});
		count_position();
		id_horizon_center('scroll-down');	
	});	
/*------Run after loader------*/		
	$(window).load(function(){ 
		$("#preOverlay").fadeOut();
		$("#timer").addClass('animated fadeIn delay');		
		/*------Increase the percent number------*/								  
		  var toNum=Number($("#percent-cd").html());
		  var sNum= toNum-25;
		  var iID=setInterval(setbgColor, 80);
		  function setbgColor()
		  {
				  document.getElementById("percent-cd").innerHTML=sNum + '%';
				  if((sNum+=1)>toNum)
				  {
						  clearInterval(iID);
				  }
		  };	
		  function circle_dim(dim){
				 var $circle = $('#progress-circle'),
				 $percent = $('#percent-cd');
				 $circle.height(dim);
				 $circle.width(dim);
				 var c_left = ( $percent.width()- dim ) / 2 + 8,
				 c_top = ( $percent.height()- dim) / 2 + 5;
				 $circle.css({
					  "left": c_left,
					  "top": c_top
				 });   
		   };
		   function re_circle(){
			   var win_h=$(window).height(),
			   win_w=$(window).width(),
			   $circle = $('#progress-circle'),
			   $percent = $('#percent-cd');
			   var s_dim=140,
			   m_dim=186,
			   l_dim=230,
			   xl_dim=256;
			   if(win_w <= 768){
				   circle_dim(s_dim);
			   }
			   else if( win_w > 768 && win_w <= 992 ){
				   circle_dim(m_dim);
			   }
			   else if ( win_w > 993 && win_w <= 1200 ){
				   circle_dim(l_dim);
			   }
			   else{
				   circle_dim(xl_dim);
			   }
		   };	
  /*------Draw the percentage circle progress------*/
		 function circle_progress(percent){
			var doughnutData = [
							{
								value: percent,
								color: "rgba(255, 255, 255, 1)"
							},
							{
								value : 100 - percent,
								color : "rgba(255, 255, 255, 0.2)"
							}
						
						],
						options = {
							percentageInnerCutout : 97,
							segmentShowStroke : false,
							animation : true,
							animationSteps : 160,
							animationEasing : "easeOutQuart"
						};
					var myDoughnut = new Chart(document.getElementById("progress-circle").getContext("2d")).Doughnut(doughnutData, options);
			};
			if (Modernizr.canvas) {					  		
				circle_progress(Number($("#percent-cd").html()));
			};
			re_circle();
			$(window).resize(function () {
				re_circle();
			});	
			
    });
	$.fn.spinload = function (opts) {
		var element = this;
		var spinner = new Spinner({
			"lines": 9,
			"length": 21,
			"width": 23,
			"radius": 0,
			"corners": 1.0,
			"rotate": 0,
			"direction": 1,
			"color": "#FFFFFF",
			"speed": 1,
			"trail": 50,
			"shadow": false,
			"hwaccel": false,
			"className": "spinner",
			"zIndex": 0,
			"top": "auto",
			"left": "auto"
		}).spin($(element).find("#preOverlay").get(0));
	};
	$(document).spinload();
})(jQuery);