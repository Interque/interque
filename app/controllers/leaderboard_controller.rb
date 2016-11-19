class LeaderboardController < ApplicationController
  def show
  	@users = User.select(:id, :score, :name).where("score > ?", 0).sort{ |x, y| y.score <=> x.score }
  end
end
