class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create, :destroy]
  before_action :redirect_from_auth_pages, only: [:new]

  def new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id

      redirect_to dashboard_path
    else
      redirect_to new_sessions_path, message: 'Wrong credentials', status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
