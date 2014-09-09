# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  user_stamp Form # user_stamp plugin by jnunemaker

  # i do this so i can check what controller/action i'm in
  before_filter :instantiate_controller_and_action_names
  private
    def instantiate_controller_and_action_names
          @current_action = action_name
          @current_controller = controller_name
    end

end
