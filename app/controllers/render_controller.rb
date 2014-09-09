class RenderController < ApplicationController
  layout nil
  def show
    @form = Form.find(params[:id])
  end
end