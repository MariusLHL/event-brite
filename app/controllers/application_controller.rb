class ApplicationController < ActionController::Base
  include SessionHelper
  
  def authenticate_user
    unless current_user
      @error = "Please log in"
      render new_session_path
    end
  end
end
