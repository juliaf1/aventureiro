class FeedsController < ApplicationController
  before_action :authenticate_user!, except: :show
  def show
    @feed = Feed.find(params[:id])
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end
end
