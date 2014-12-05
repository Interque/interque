class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :new, :create, :destroy, :show]


  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      #if (Question.tagged_with(params[:tag])).length > 0
        @questions = Question.tagged_with(params[:tag]).order(:cached_votes_up => :desc)
      #end
    else
      @questions = Question.all.order(:cached_votes_up => :desc)
    end

    # if params[:employer]
    #   @questions = Question.search(params[:employer]).order(:cached_votes_up => :desc)  
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = Answer.new(question: @question)
    #@answer = @question.answers.new
    #@question_comment = @question.comments.new
    #@answer_comment = @answer.comments.new
  end

  # GET /questions/new
  def new
    @question = Question.new
    @employer = Employer.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    employer = Employer.find_or_create_by(name: params[:name])
    @question.employer = employer

    # answer = Answer.create(params)
    # @question.answer = answer

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description, :user_id, :tag_list)
  end

  def require_login
    unless current_user
      redirect_to root_url, { :notice => "Please login to continue." }
    end
  end
end
