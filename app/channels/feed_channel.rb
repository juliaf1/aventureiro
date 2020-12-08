class FeedChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    feed = Feed.find(1)
    stream_for feed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
