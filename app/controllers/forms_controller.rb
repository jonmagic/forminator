class FormsController < ApplicationController
  before_filter :authenticate
  def index
    @forms = Form.all(:creator_id => current_user.id).sort_by(&:name)
  end
  
  def show
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.js { render :json => @form.to_json }
    end
  end
  
  def reorder
    @form = Form.find(params[:id])
    if @form.reorder(params[:question])
      render :nothing => true, :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def new
    @form = Form.new
    render :layout => false
  end
  
  def create
    @form = Form.new(params[:form])
    @form.questions << Question.new(:text => @form.name, :type => 'title')
    if @form.save
      render :partial => 'form', :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def update
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
    @form.update_attributes(params[:form])
    respond_to do |format|
      format.js
      format.html { render :nothing => true, :response => 200 }
    end
  end
  
  def destroy
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
    @form.destroy
    flash[:notice] = "Successfully destroyed form."
    redirect_to forms_url
  end
end
