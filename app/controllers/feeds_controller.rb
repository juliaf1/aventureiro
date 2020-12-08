class FeedsController < ApplicationController
  def show
    @feed = Feed.find(params[:id])
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end
end
