class ReceiverController < ApplicationController
  protect_from_forgery :except => [:update]
  def update
    @form = Form.find(params[:id])
    # if verify_recaptcha(:model => @form, :message => 'You incorrectly filled out the form.')
      flash[:notice] = "Form was sent successfully" if FormMailer.deliver_form(@form, params[:questions])
      redirect_to form_message_path(@form)
    # else
    #   redirect_to :back
    # end
    
  end
end