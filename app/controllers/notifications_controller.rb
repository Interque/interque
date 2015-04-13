class NotificationsController < ApplicationController
  def index
  	@questions = Question.all.order(:updated_at => :desc)
  	@users = User.all
  	@answers = Answer.all.order(:updated_at => :desc)
  	@total_votes = 0
  	@total_user_question_answers = 0
  	@total_approved = 0
  	num_votes
  	total_answers_to_user_questions
  	total_approved_questions

  	@current_notification = ReadNotification.find_by(:user_id => current_user.id)
  	compare_timestamps(@current_notification)

  	# if current_notification
  	# 	unless current_notification.user_approved_questions == @total_approved
  	# 		current_notification.user_approved_questions = @total_approved
  	# 		current_notification.read_at = Time.now
  	# 		current_notification.save
  	# 	end
  	# 	unless ReadNotification.find_by(:user_id => current_user.id).votes_on_user_answers == @total_votes
  	# 		current_notification.votes_on_user_answers = @total_votes
  	# 		current_notification.read_at = Time.now
  	# 		current_notification.save
  	# 	end
  	# 	unless ReadNotification.find_by(:user_id => current_user.id).answers_on_user_questions == @total_user_question_answers
  	# 		current_notification.answers_on_user_questions = @total_user_question_answers
  	# 		current_notification.read_at = Time.now
  	# 		current_notification.save
  	# 	end
  	# else
  	# 	ReadNotification.create(:user_id => current_user.id, :user_approved_questions => @total_approved, :votes_on_user_answers => @total_votes, :answers_on_user_questions => @total_user_question_answers, :read_at => Time.now)
  	# end

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

  def total_approved_questions
  	@total_approved = current_user.questions.where(:approved => true).count
  end

  def compare_timestamps(current_notification)
  	if current_notification
	  	current_user.questions.find_each do |question|
	  		if question.updated_at > current_notification.read_at
	  			current_notification.read_at = question.updated_at
	  			current_notification.save
	  			if @@user_unread_notifications.include?(question)
	  				@@user_unread_notifications.clear
	  				return_unread
	  			end
	  		elsif question.answers.any? && question.answers.last.updated_at > current_notification.read_at
	  			current_notification.read_at = question.answers.last.updated_at
	  			current_notification.save
	  			if @@user_unread_notifications.include?(question.answers.last)
	  				@@user_unread_notifications.clear
	  				return_unread
	  			end
	  		end
	  	end

	  	current_user.answers.find_each do |answer|
	  		answer.votes_for.find_each do |vote|
	  			if vote.updated_at > current_notification.read_at
	  				current_notification.read_at = vote.updated_at
	  				current_notification.save
	  				if @@user_unread_notifications.include?(vote)
	  					@@user_unread_notifications.clear
	  					return_unread
	  				end
	  			end
	  		end
	  	end
	  else
	  	ReadNotification.create(:user_id => current_user.id, :read_at => Time.now)
	  end
  end
end
