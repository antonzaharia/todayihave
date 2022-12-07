class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params.except(:tags))
    create_or_delete_posts_tags(@post, post_params[:tags]) if post_params[:tags]

    respond_to do |format|
      if @post.save
        @post.broadcast_prepend_to 'post_index', target: 'posts', partial: 'posts/post', locals: { post: @post }
        @post.send_notifications_to_mentions

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("post_index", partial: "posts/post", locals: { post: @post }),
            turbo_stream.update("new_post", template: "posts/new", locals: { post: Post.new }),
          ]
        end
        format.html { redirect_to root_path }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new_post", partial: "posts/form", locals: { post: @post }),
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @post.assign_attributes(post_params.except(:tags))
    create_or_delete_posts_tags(@post, post_params[:tags]) if post_params[:tags]

    respond_to do |format|
      @post.send_notifications_to_mentions

      if @post.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(helpers.dom_id(@post), partial: 'posts/post', locals: { post: @post }),
          ]
        end
        format.html { redirect_to root_path }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("edit_#{helpers.dom_id(@post)}", template: "posts/edit", locals: { post: @post }),
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def create_or_delete_posts_tags(post, tags)
    post.post_tags.destroy_all
    tags = tags.split(",")
    tags.map(&:strip).each do |tag|
      post.tags << Tag.find_or_create_by(name: tag)
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
