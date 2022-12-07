class HomeController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:index]
  before_action :redirect_from_auth_pages, only: [:index]

  def index
  end

  def dashboard
    @posts = Post.all.order(created_at: :desc)
  end
end
