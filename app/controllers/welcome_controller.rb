class WelcomeController < ApplicationController
   # before_action :require_logged_in

  def home
  end

  def root
    if !current_user.nil?
      redirect_to home_path
    else
      redirect_to login_path
    end
  end
end
