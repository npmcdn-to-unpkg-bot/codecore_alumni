$(function() {

  function wowInit() {
    new WOW().init();
  }

	function progressBar() {
		$(".progress_bar").each(function(){
      var progressValue = parseInt($(this).attr("value"));
      $(this).progressbar({
        value: progressValue
      });
    });
	}

  function skillTitle() {
    $('.skills-progress').each(function() {
      $(this).children('span.skills').prependTo($(this).children('.progress_bar'));
      $(this).children('span.proficiency').appendTo($(this).children('.progress_bar'));
    });
  }


	$(document).ready(function(){
  	jQuery(".best_in_place").best_in_place();
    wowInit();
  	progressBar();
	  skillTitle();
  });

  $(window).load(function() {
  });

});
