# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_or_session_page?
    @current_controller == "users" || @current_controller == "sessions" || @current_controller == "passwords" ? false : true
  end
end
