class SpotsController < ApplicationController

  def show
    @spot = Spot.find_by_id(params[:id])
    @messages = @spot.messages
  end

  def index
    render
  end

end
