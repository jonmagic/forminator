class RenderController < ApplicationController
  before_filter :authenticate
  layout nil

  def show
    @form = Form.find(params[:id], :creator_id => current_user.id)
  end
end