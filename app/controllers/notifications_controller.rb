class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:created_at => :desc)
  	@users = User.all
  end
end
