class ResponseController < ApplicationController
  layout 'response'
  def thankyou
    @form = Form.find(params[:id])
  end
end