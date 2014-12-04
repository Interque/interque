class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :employer
	has_many :answers
	has_many :comments
	acts_as_votable

	def self.search(params)
		emp = Employer.where(name: params).take
		if emp
			Question.where(employer_id: emp.id)
		else
			Question.all  
		end
	end

	def score
  	self.get_upvotes.size
  end

end
