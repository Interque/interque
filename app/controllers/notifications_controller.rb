class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:id => :desc)
  end
end
