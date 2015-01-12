
$(document).ready(function(){
	
	/*
	* Set listener if someone comentts on my web pag please note me
	*
	*/

	
	/*FB.Event.subscribe(event, function(){
		
		
		console.log(event);
		
	});*/
	
	//document.oncontextmenu = function(){return false;};
	//document.onselectstart= function() {return false;}; 
	
	/*
	* Reset dearch dropdowns after page refresh
	*
	*/


	$(document).ready(function(){

			$('#share_button').click(function(e){

				e.preventDefault();
				FB.ui(
				{
				method: 'feed',
				name: $(this).attr("data-name"),
				link: $(this).attr("data-link"),
				//picture: 'http://www.hyperarts.com/external-xfbml/share-image.gif',
				caption: $(this).attr("data-caption"),
				description: $(this).attr("data-description"),
				message: ''
				});

				return false;
			});
		});


	$("#category").val("");
	$("#model").val("");

	/*
	* After choose category load models da check dropdowns to enable search button
	*
	*/

	$("#category").change(function(){

		var category = $("#category").val();
		var model = $("#model").val();
		
		$("#search-result").hide();
		$("#search-loader").show();
		
		$.getJSON('index.php?option=com_geocars&task=getCarModelsByCategory&category=' + category, function(data){
			
			$("#search-result").show();
			$("#search-loader").hide();
			
			var html = "<option value=''>აირჩიეთ მოდელი</option>";

			if( data.models.length > 0 ){
				
				$.each(data.models, function(key, item){
					html += "<option value='"+item.id+"'>"+item.name+"</option>";
				});
			}

			$("#model").html("").html(html);
			
		});

		if( category.length > 0 &&  model.length > 0){
			enableSearchButton();
		}else{
			disableSearchButton();
		}
		
	});

	/*
	* Check if category and model is choosen and enable form
	*
	*/

	$("#model").change(function(){

		var category = $("#category").val();
		var model = $("#model").val();

		if( category.length > 0 &&  model.length > 0){
			enableSearchButton();
		}else{
			disableSearchButton();
		}

	});

	/*
	* Default form submiting on click event 
	*
	*/

	$("#geocars_default_submit").bind("click", function(){
		$("#geocars_default_form").submit();
	});

	/*
	* Check and continue submiting form
	*
	*/
	$("#geocars_default_form").bind("submit",function(){

		var category = $("#category").val();
		var model = $("#model").val();

		if( !$("#geocars_default_submit").hasClass("disabled") ){
			//Continue submiting form
		}else{
			alert("Choose Items");
			return false;
		}

	});


	/*
	* Vote car model buttons event
	*
	*/

	$("#success-vote").bind("click", function(){

		if( !$(this).hasClass("disabled") ){
			var model_id = $(this).attr("data-carid");
			
			disableVotting();
			
			if( model_id.length > 0 ){
				$.getJSON("index.php?option=com_geocars&task=voteSuccess&model=" + model_id, function(data){

					if( data.code == 0 ){
						disableVotting();
					}
				})
			}
		}
	});

	/*
	* Vote car model buttons event
	*
	*/

	$("#danger-vote").bind("click", function(){
		if( !$(this).hasClass("disabled") ){
			var model_id = $(this).attr("data-carid");
			
			disableVotting();
			
			if( model_id.length > 0 ){
				$.getJSON("index.php?option=com_geocars&task=votedanger&model=" + model_id, function(data){
					if( data.code == 0 ){
						disableVotting();
					}
				})
			}
		}

	});

	$( "#detail_info" ).click(function() {
	  $( "#detail_info_body" ).toggle( "slow", function() {
	    // Animation complete.
	  });
	});

	

});

/*
* Enable search button 
*
*/
function enableSearchButton(){
	$("#geocars_default_submit").removeClass("disabled");
}

/*
* Disable search button 
*
*/
function disableSearchButton(){
	$("#geocars_default_submit").addClass("disabled");
}

/*
* Disable Vote buttons
*
*/
function disableVotting(){
	$("#danger-vote").addClass("disabled");
	$("#success-vote").addClass("disabled");



}






