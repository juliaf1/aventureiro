class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_posts_path
    else
      render :index
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:rich_body, :photo)
  end
end
