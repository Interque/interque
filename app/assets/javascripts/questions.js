// Sliding answer field // 
/////////////////////////
$( document ).on('ready page:load', function() {
  console.log('Locked and Loaded');
  $('.new-answer-btn').click(function(event){
    event.preventDefault();
    $('.answers-container').slideToggle();
  });
});