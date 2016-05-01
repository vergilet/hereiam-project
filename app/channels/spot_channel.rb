# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SpotChannel < ApplicationCable::Channel
  def subscribed
    stream_from "spot_channel_#{spot.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    spot.messages.create!(content: data['message'])
  end

  private

  def spot
    @spot ||= Spot.find_by_id(params[:spot_id])
  end
end
