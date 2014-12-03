class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :employer
	has_many :answers
	

	def self.search(params)
		if params
			@questions = Question.where(user_id: params)
    else
      @questions = Question.all     
    end
	end

end
