class HomeController < ApplicationController
  layout '_base'

  def index
    render
  end

  def map
    @spots = Spot.all
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.description
      marker.json({
        id: spot.id,
        title: spot.title
      })
    end
  end
end
