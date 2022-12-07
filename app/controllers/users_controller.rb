class UsersController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
  before_action :redirect_from_auth_pages, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
