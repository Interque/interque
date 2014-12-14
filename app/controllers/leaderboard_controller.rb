class LeaderboardController < ApplicationController
  def show
  	@users = User.all.sort{ |x, y| y.score <=> x.score }
  end
end
