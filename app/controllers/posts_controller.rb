class PostsController < ApplicationController
  before_action :find_feed, only: [:create, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.feed = @feed
    @post.user = current_user
    if @post.save
      feed_live_update(@feed, @post)
    else
      render "feeds/show"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize current_user, :owner?, policy_class: UserPolicy
    if @post.destroy
      redirect_to feed_path(@feed)
    else
      render "feeds/show"
    end
  end

  private

  def feed_live_update(feed, post)
    @feed = feed
    @post = post
    FeedChannel.broadcast_to(
      @feed,
      render_to_string(partial: "post", locals: { post: @post })
    )
    redirect_to feed_path(@feed, anchor: "post-#{@post.id}")
  end

  def find_feed
    @feed = Feed.first
  end

  def post_params
    params.require(:post).permit(:rich_body, :photo)
  end
end
