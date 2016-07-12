class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @questions = Question.new
  end

  def create

    @questions = Question.new
    @questions.title = params[:question][:title]
    @questions.body = params[:question][:body]
    @questions.resolved = params[:question][:resolved]


   if @questions.save

     flash[:notice] = "Question was saved successfully."
     redirect_to @questions
   else

     flash.now[:alert] = "There was an error saving the Question. Please try again."
     render :new
   end


  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
