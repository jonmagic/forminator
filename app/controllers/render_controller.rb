class RenderController < ApplicationController
  before_filter :authenticate
  layout nil

  def show
    @form = Form.first(:id => params[:id], :creator_id => current_user.id)
  end
end