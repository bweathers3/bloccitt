class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]


   if @question.save

     flash[:notice] = "Question was saved successfully."
     redirect_to @question
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
