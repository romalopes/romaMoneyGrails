if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}


$('document').ready(function() {
  $("#sendToTopPage").click(function(){
    $(window).scrollTop(0);
   });

});
function showDialogAddTransaction(){
    $("#addTransaction").dialog();
    return false;
}
