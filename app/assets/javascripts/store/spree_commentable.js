//= require store/spree_core
(function() {

  $(function() {
    $('#comment_form_check').validate();
    $('#change_name').on('click', function(){
      $('#commenter_name').show();
      $('#stand_name').hide();
      return false;
    });
  });

}).call(this);