// Sliding answer field //
/////////////////////////
$( document ).on('ready page:load', function() {
  $('.just-tags a').addClass('add-to-token');
  $('.new-answer-btn').click(function(event){
    event.preventDefault();
    $('.answers-container').slideToggle();
  });

  $('#notice').fadeOut(1200);

});
