class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.authenticate(params[:session][:password])
      sign_in(@user)
    end
  end

  def destroy
    @user = current_user
    sign_out(@user)
  end

end
