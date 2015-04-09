// Sliding answer field // 
/////////////////////////
$( document ).on('ready page:load', function() {
  $('.new-answer-btn').click(function(event){
    event.preventDefault();
    $('.answers-container').slideToggle();
  });

  $('#notice').fadeOut(1200);

});