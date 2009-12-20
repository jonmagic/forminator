class ReceiverController < ApplicationController
  protect_from_forgery :except => [:update]
  def update
    @form = Form.find(params[:id])
    flash[:notice] = "Form was sent successfully" if FormMailer.deliver_form(@form, params[:questions])
    redirect_to form_path(@form)
  end
end