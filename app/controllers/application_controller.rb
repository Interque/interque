class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :set_application_question

  @@counter

  @@user_unread_notifications = []

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
			"Level 7: Deep Blue"
		elsif current_user.score < 750
			"Level 8: Watson"
		elsif current_user.score < 1000
			"Level 9: Skynet"
		else
			"Level 10: ED TORO"
		end
	end
	helper_method :rank

	def rank_total
		if current_user.score < 10
			10
		elsif current_user.score < 35
			25 #25
		elsif current_user.score < 50
			50 #15
		elsif current_user.score < 100
			100 #50
		elsif current_user.score < 150
			150 #50
		elsif current_user.score < 200
			200 #50
		elsif current_user.score < 300
			300 #100
		elsif current_user.score < 500
			500 #200
		elsif current_user.score < 750
			750 #250
		elsif current_user.score < 1000
			1000 #250
		else
			1000
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

	def unread_notifications
		users_read_notification = ReadNotification.find_by(:user_id => current_user.id)
		current_user.questions.find_each do |question|
			if question.approved && question.updated_at > users_read_notification.read_at
				unless @@user_unread_notifications.include?(question)
					@@user_unread_notifications << question
				end
			elsif question.answers.any? && question.answers.last.updated_at > users_read_notification.read_at
				unless @@user_unread_notifications.include?(question.answers.last)
					@@user_unread_notifications << question.answers.last
				end
			end
		end

		current_user.answers.find_each do |answer|
			answer.votes_for.find_each do |vote|
				if vote.updated_at > users_read_notification.read_at
					unless @@user_unread_notifications.include?(vote)
						@@user_unread_notifications << vote
					end
				end
			end
		end
	end

	def return_unread
		unread_notifications
		return @@user_unread_notifications.count
	end
	helper_method :return_unread
end



