class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :employer

	#accepts_nested_attributes_for :employer

	def self.search(params)
		if params
			@questions = Question.where(user_id: params)
    else
      @questions = Question.all     
    end
	end

end
