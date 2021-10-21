class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{current_user.id}"
    puts "Streaming room_channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
