class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments

  acts_as_votable

  validates :description, presence: true

  # this relates to our voting system...confusingly...we also have 
  # score as a column in our Users table/model
  def score
  	self.get_upvotes.size - self.get_downvotes.size
  end

  #this relates to our gamification system
	def update_score
 		user.score += 10
    user.save
	end

  def update_bounty
    user.score += 25
    user.save
  end
end
