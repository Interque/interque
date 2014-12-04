class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments

  acts_as_votable

  def score
  	self.get_upvotes.size - self.get_downvotes.size
  end
end
