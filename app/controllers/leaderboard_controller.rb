class LeaderboardController < ApplicationController
  def show
  	@users = User.select(:id, :score, :name).where("score > ?", 0).limit(100).sort{ |x, y| y.score <=> x.score }
  end
end
