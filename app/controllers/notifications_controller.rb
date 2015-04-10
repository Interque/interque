class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:updated_at => :desc)
  	@users = User.all
  	@answers = Answer.all.order(:updated_at => :desc)
  	@total_votes = 0
  	@total_user_question_answers = 0
  	num_votes
  	total_answers_to_user_questions
  end

  def num_votes
  	current_user.answers.find_each do |answer|
  		@total_votes += answer.votes_for.count
  	end
  	@total_votes
  end

  def total_answers_to_user_questions
  	current_user.questions.find_each do |question|
  		@total_user_question_answers += question.answers.count
  	end
  	@total_user_question_answers
  end
end
