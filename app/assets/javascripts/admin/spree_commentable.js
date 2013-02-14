(function ($) {
  $('.comment_line').live("click", function(){
    $(this).parent('.comment').children('span.comment_line').toggle();
  });
})(jQuery);