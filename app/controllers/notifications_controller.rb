class NotificationsController < ApplicationController
  def index
  	@questions = Question.all
  	@users = User.all
  	@answers = Answer.all.order(:updated_at => :desc)
    @voted_answers = Answer.where(:user_id => current_user.id).includes(:votes_for).order(updated_at: :desc)
  	@total_votes = 0
  	@total_user_question_answers = 0
  	@total_approved = 0
  	num_votes
  	total_answers_to_user_questions
  	total_approved_questions

  	@current_notification = ReadNotification.find_by(:user_id => current_user.id)
  	mark_as_read(@current_notification)
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

  def mark_as_read(current_notification)
  	# all_questions = current_user.questions.order(:updated_at => :desc)
  	# all_questions = current_user.questions.select { |q| q.updated_at > current_notification.read_at }
  	if current_notification
  		current_notification.read_at = Time.now
  		current_notification.save
  		@@user_unread_notifications.clear
  		return_unread
	  	# current_user.questions.find_each do |question|
	  	# 	if question.updated_at > current_notification.read_at
	  	# 		current_notification.read_at = question.updated_at
	  	# 		current_notification.save

  		# 		@@user_unread_notifications.clear
  		# 		return_unread
	  	# 	elsif question.answers.any? && question.answers.last.updated_at > current_notification.read_at
	  	# 		current_notification.read_at = question.answers.last.updated_at
	  	# 		current_notification.save

  		# 		@@user_unread_notifications.clear
  		# 		return_unread
	  	# 	end
	  	# end

	  	# current_user.answers.find_each do |answer|
	  	# 	answer.votes_for.find_each do |vote|
	  	# 		if vote.updated_at > current_notification.read_at
	  	# 			current_notification.read_at = vote.updated_at
	  	# 			current_notification.save

	  	# 			@@user_unread_notifications.clear
	  	# 			return_unread
	  	# 		end
	  	# 	end
		  # 		# votes_by_update = answer.votes_for.order(:updated_at => :desc)
		  # 		# if answer.votes.any? && votes_by_update.first.updated_at > current_notification.read_at
		  # 		# 	current_notification.read_at = votes_by_update.first.updated_at
		  # 		# 	current_notification.save
		  # 		# 	@@user_unread_notifications.clear
		  # 		# 	return_unread
		  # 		# end

	  	# end
	  else
	  	ReadNotification.create(:user_id => current_user.id, :read_at => Time.now)
	  end
  end
end
