class QuestionsController < ApplicationController
  before_filter :authenticate
  before_filter :types, :except => ['update','create','destroy']
  layout nil
  
  def new
    @question = Question.new
  end
  
  def create
    @form = Form.first(:id => params[:form_id], :creator_id => current_user.id)
    @question = Question.new(params[:question])
    @form.questions << @question
    if @form.save
      render :partial => 'question', :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def edit
    @form = Form.first(:id => params[:form_id], :creator_id => current_user.id)
    @question = @form.questions.find(params[:id])
  end
  
  def update
    @form = Form.first(:id => params[:form_id], :creator_id => current_user.id)
    @question = @form.questions.find(params[:id])
    if @question.update_attributes(params[:question])
      render :partial => 'question', :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def destroy
    @form = Form.first(:id => params[:form_id], :creator_id => current_user.id)
    @form.questions.delete_if {|q| q.id.to_s == params[:id] }
    if @form.save
      render :nothing => true, :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  private
    def types
      @types = [["Title","title"],["SubTitle","subtitle"],["Divider","divider"],["Short Answer","text"],["Long Answer","paragraph"],["Multiple Choice","multiple_choice"],["Checkboxes","checkboxes"],["Drop Down List","list"]]
    end
end