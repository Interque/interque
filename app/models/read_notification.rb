class ReadNotification < ActiveRecord::Base
	# attr_accessible :user_approved_questions, :answers_on_user_questions, :votes_on_user_answers, :read_at
  belongs_to :user

  validates :user_id, uniqueness: true
end
