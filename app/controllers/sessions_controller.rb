class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.authenticate(params[:session][:password])
      sign_in(@user)
    end
    redirect_to posts_path
  end

  def destroy
    @user = current_user
    sign_out(@user) if @user
    redirect_to new_session_path
  end

end
