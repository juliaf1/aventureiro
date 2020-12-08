class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_posts_path, anchor: @post
    else
      render :index
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize current_user, :owner?, policy_class: UserPolicy
    if @post.destroy
      redirect_to user_posts_path
    else
      render :index, anchor: @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:rich_body, :photo)
  end
end
