jQuery( document ).ready( function( $ ) {
  //onepage nav
      $('#navs').onePageNav({
        currentClass: 'active',
        filter: ':not(.external)',
        scrollThreshold: 0.25,
        scrollOffset: 30
      });
  //Sticky Nav
      $(".main-nav").sticky({ topSpacing: 0 });

	//tooltips
      $( 'body' ).tooltip({
        selector: "a[data-toggle=tooltip]"
      });
    //Photo Gallery
      $('#gallery-container').sGallery({
        fullScreenEnabled: true
      });

    //Google Maps
      $('#gmap').gmap3({
        marker:{address:"Haltern am See, Weseler Str. 151", options:{icon: "img/location1.png"}},
        map:{
            options:{
              zoom: 14
            }
           }
      });

});	