$( document ).on('ready page:load', function() {
  console.log('Locked and Loaded');
  $('.question-comments-btn').click(function(event){
    event.preventDefault();
    $('.question-comment-container').slideToggle();
  });

  $('.new-question-comment').click(function(event){
    event.preventDefault();
    $('.question-comment-field').slideToggle();
  });

  $('.new-answer-btn').click(function(event){
    event.preventDefault();
    $('.answers-container').slideToggle();
  });
});