class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if !!@user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to movies_path, notice: ''
    else
      message = "Somenthing went wrong! Make sure your username and passsword are correct"
      redirect_to login_path, notice: message
    end
  end
end
