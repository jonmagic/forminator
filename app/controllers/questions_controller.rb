class QuestionsController < ApplicationController
  before_filter :authenticate
  before_filter :types, :except => ['update','create','destroy']
  layout nil
  
  def new
    @question = Question.new
  end
  
  def create
    @form = Form.find(params[:form_id])
    @question = Question.new(params[:question].merge(:ordinal => @form.questions.length+1))
    @form.questions << @question
    if @form.save
      render :partial => 'question', :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def edit
    @form = Form.find(params[:form_id])
    @question = @form.questions.find(params[:id])
  end
  
  def update
    @form = Form.find(params[:form_id])
    @question = @form.questions.find(params[:id])
    if @question.update_attributes(params[:question])
      render :nothing => true, :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def destroy
    
  end
  
  private
    def types
      @types = [["Title","title"],["SubTitle","subtitle"],["Divider","divider"],["Text Field","text"],["Text Box","paragraph"],["Multiple Choice","multiple_choice"],["Checkboxes","checkboxes"],["Drop Down List","list"],["If Then","ifthen"]]      
    end
end