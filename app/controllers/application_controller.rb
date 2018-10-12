class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def require_sign_in
    unless current_admin
      flash[:alert] = "You must be signed in to do that."
      redirect_to welcome_welcome_path
    end
  end
end
