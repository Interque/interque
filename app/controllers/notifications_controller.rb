class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:updated_at => :desc)
  	@users = User.all
  	@answers = Answer.all.order(:updated_at => :desc)
  	# @question = Question.find(params[:id])
  end
end
