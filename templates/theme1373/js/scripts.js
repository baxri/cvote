jQuery(document).ready(function($) {
	$('ul li:last-child').addClass('lastItem');
	$('ul li:first-child').addClass('firstItem');
	
/*ScrollToTop button*/
	$(function() {
		$(window).scroll(function() {
			if($(this).scrollTop() != 0) {
				$('.rt-block.totop').fadeIn();	
			} else {
				$('.rt-block.totop').fadeOut();
			}
		});
	});
	
/*Avoid input bg in Chrome*/
	if ($.browser.webkit) {
		$('input').attr('autocomplete', 'off');
	}
	
/*Zoom Icon. Portfolio page*/
	$('#port a.modal').hover(function(){
		$(this).find('span.zoomIcon').stop(true, true).animate({opacity: 1, top: '50%'}, 200);
	},function(){
		$(this).find('span.zoomIcon').stop(true, true).animate({opacity: 0, top: '-50%'}, 100);
	})

/*Pagination Active Button*/
	$('.k2Pagination ul li:not([class])').addClass('num');
	$('div.pagination ul li:not([class])').addClass('num');	
	$('div.itemCommentsPagination ul li:not([class])').addClass('num');	
	
	$('.moduleItemImage, .catItemImageBlock a, .itemImageBlock a, .userItemImageBlock a, .genericItemImageBlock a, .tagItemImageBlock a').append('<strong></strong>');

	$('.menutop li.root > .item').each(function(num){
		$(this).addClass('item'+(num+1))	
		
	})

// tag cloud
	
	$('.k2TagCloudBlock').prepend('<div id="myCanvasContainer"><canvas width="300" height="200" id="myCanvas"></canvas></div>')
	
        if(!$('#myCanvas').tagcanvas({
          textColour: '#fff',
          outlineColour: '#00ccff',
		  outlineThickness:1,
          reverse: true,
          depth: 0.8,
          maxSpeed: 0.05
        },'tags')) {
          // something went wrong, hide the canvas container
          $('#myCanvasContainer').hide();
        }
		
	$('#tags a').css({fontSize:14})	
	
});