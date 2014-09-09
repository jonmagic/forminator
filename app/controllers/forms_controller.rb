class FormsController < ApplicationController
  before_filter :authenticate
  def index
    @forms = Form.all(:creator_id => current_user.id)
  end
  
  def show
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
  end
  
  def new
    @form = Form.new
    render :layout => false
  end
  
  def create
    @form = Form.new(params[:form])
    if @form.save
      render :partial => 'form', :response => 200
    else
      render :nothing => true, :response => 500
    end
  end
  
  def update
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
    if @form.update_attributes(params[:form])
      flash[:notice] = "Successfully updated form."
      redirect_to @form
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
    @form.destroy
    flash[:notice] = "Successfully destroyed form."
    redirect_to forms_url
  end
end
