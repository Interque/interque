class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :employer
	has_many :answers
	has_many :comments
	acts_as_votable

	def self.search(params)
		if params
			@questions = Question.where(user_id: params)
    else
      @questions = Question.all     
    end
	end

	def score
  	self.get_upvotes.size
  end

end
