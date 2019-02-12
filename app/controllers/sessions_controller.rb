class SessionsController < ApplicationController
  def new
  # render login form
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session["user_id"] = @user.id
        redirect_to home_path
    else
        flash["notice"] = "No user found with that name and password."
        render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
