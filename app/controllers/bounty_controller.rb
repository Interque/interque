class BountyController < ApplicationController
  def index
  	@questions = Question.find_each.select { |q| q.bounty }
  end
end
