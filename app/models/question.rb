class Question < ActiveRecord::Base
	belongs_to :user

	def self.search(params)
		if params
			@questions = Question.where(user_id: params)
    else
      @questions = Question.all     
    end
	end
end
