class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments

  acts_as_votable

  validates :description, presence: true


  def score
  	self.get_upvotes.size - self.get_downvotes.size
  end

	def update_score
 		user.score += 10
    user.save
	end
end
