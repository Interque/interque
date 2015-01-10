class AdminController < ApplicationController
  def index
  	@questions = Question.all
    
  	unless current_user && current_user.administrator?
			redirect_to root_path
		end
  end
end

# private 

  # def activate
  # 	@question = Question.find(params[:id])
  # 	@question.approved = true
  # 	@question.save
  # end
