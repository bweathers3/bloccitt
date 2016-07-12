class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @questions = Question.new
  end

  def create
    
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
