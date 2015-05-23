class AdminController < ApplicationController
  def index
  	@questions = Question.all
    
  	unless current_user && current_user.administrator?
			redirect_to root_path
		end

    if current_user && current_user.administrator?
      raise Exception
    end
  end
end
