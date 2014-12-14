class SplashController < ApplicationController
  def index
    if current_user
      redirect_to questions_path
    end
  end
end
