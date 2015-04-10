class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:updated_at => :desc)
  	@users = User.all
  	@answers = Answer.all.order(:updated_at => :desc)
  	@total_votes = 0
  	num_votes
  end

  def num_votes
  	current_user.answers.find_each do |answer|
  		@total_votes += answer.votes_for.size
  	end
  	@total_votes
  end
end
