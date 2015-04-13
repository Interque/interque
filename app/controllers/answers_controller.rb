class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    redirect_to root_url
    #@answers = Answer.all
  end

  def show
  end

  def new
    #@answer = Answer.new
    redirect_to root_url
  end

  def edit
    unless current_user && current_user.administrator
      redirect_to root_url
    end
  end

  def create
    @answer = current_user.answers.new(answer_params)
    
    if @answer.question.bounty
      @answer.update_bounty
    else
      @answer.update_score
    end

    respond_to do |format|
      if @answer.save
        format.html { redirect_to :back, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
        expire_fragment("approvals")
        notification = ReadNotification.find_by(:user_id => @answer.question.user_id)
        notification.read_at = nil
        notification.save
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote  
    @answer = Answer.find(params[:id])
    a = @answer.score
    @answer.upvote_by(current_user)
    env["HTTP_REFERER"] += "#answer-#{params[:id]}"
    redirect_to :back
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p a
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    if a < @answer.score
      if @answer.question.bounty
        @answer.user.score += 10
        @answer.user.save
      else
        @answer.user.score += 5
        @answer.user.save
      end
    end
    expire_fragment("votes")
  end

  def downvote
    @answer = Answer.find(params[:id])
    a = @answer.score
    @answer.downvote_by current_user
    env["HTTP_REFERER"] += "#answer-#{params[:id]}"
    redirect_to :back
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p "this is the downvote"
    p a
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    if a > @answer.score
      @answer.user.score -= 6
      @answer.user.save
    end
    expire_fragment("votes")
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def total_votes
  #   @answers = current_user.answers
  #   votes_total = 0
  #   @answers.find_each do |answer|
  #     votes_total += answer.votes_for.size
  #   end
  #   votes_total
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:description, :question_id, :user_id)
    end
end
