class HomeController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:index]
  before_action :redirect_from_auth_pages, only: [:index]

  def index
  end

  def dashboard
    @posts = Post.all.order(created_at: :desc)
    @tags = Tag.ordered_by_posts.first(5)
  end
end
