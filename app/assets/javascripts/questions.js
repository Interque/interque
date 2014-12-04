$( document ).ready(function() {
  console.log('Locked and Loaded');
  $('.question-comments-btn').click(function(){
    $('.question-comment-container').slideToggle();
  });

  $('.new-question-comment').click(function(){
    $('.question-comment-field').slideToggle();
  });

  $('.new-answer-btn').click(function(){
    $('.answers-container').slideToggle();
  });
});