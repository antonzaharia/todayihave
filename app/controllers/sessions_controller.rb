class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
    else
      redirect_to new_sessions_path, message: 'Wrong credentials', status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
