class SitemapController < ApplicationController
  def show
    @questions = Question.all
  end
end
