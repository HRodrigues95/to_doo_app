class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # A better name for this method would be `user_logged_in?`
  def logged_in_user
    # This is called early exiting. It's better to return ASAP
    # than to go through lots of conditions/db access/etc
    return if logged_in?

    flash[:danger] = 'Please login'
    redirect_to login_url
  end
end
