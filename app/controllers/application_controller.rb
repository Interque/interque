class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :set_application_question



private

	# def set_application_question
	# 	@question = Question.new
	# end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def rank
		if current_user.score < 10
			"grasshopper"
		elsif current_user.score < 35
			"Level 1"
		elsif current_user.score < 50
			"Level 2"
		elsif current_user.score < 100
			"Level 3"
		elsif current_user.score < 150
			"Level 4"
		elsif current_user.score < 200
			"Level 5"
		elsif current_user.score < 300
			"Level 6"
		elsif current_user.score < 500
			"7"
		else
			"Ed Toro"
		end
	end
	helper_method :rank

	def rank_total
		if current_user.score < 10
			10
		elsif current_user.score < 35
			35
		elsif current_user.score < 50
			50
		elsif current_user.score < 100
			100
		elsif current_user.score < 150
			150
		elsif current_user.score < 200
			200
		elsif current_user.score < 300
			300
		elsif current_user.score < 500
			500
		else
			500
		end
	end
	helper_method :rank_total

	def rank_percentage
		(current_user.score.to_f/rank_total.to_f)*100
	end
	helper_method :rank_percentage
end
