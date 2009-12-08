class QuestionsController < ApplicationController
  before_filter :authenticate
  def create
    @question = Question.new(params[:question])
    if @question.save
      # render :partial
    else
      render
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
end