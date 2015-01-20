class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :set_application_question

  @@counter

private


	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def admin_access
		unless current_user.administrator?
			redirect_to root_path
		end
	end

	def rank
		if current_user.score < 10
			"Level 0: muggle"
		elsif current_user.score < 35
			"Level 1: grasshopper"
		elsif current_user.score < 50
			"Level 2: padawan"
		elsif current_user.score < 100
			"Level 3: bowser"
		elsif current_user.score < 150
			"Level 4: rafiki"
		elsif current_user.score < 200
			"Level 5: einstein"
		elsif current_user.score < 300
			"Level 6: yoda"
		elsif current_user.score < 500
			"Level 7: deepBlue"
		else
			"Level 8: ED TORO"
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

	def unapproved_questions
		@questions = Question.all
		@@counter = 0
		@questions.each do |question|
			if question.approved? == false
				@@counter += 1
			end
		end
		return @@counter
	end
	helper_method :unapproved_questions
end
