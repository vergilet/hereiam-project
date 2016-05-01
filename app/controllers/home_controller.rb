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
      marker.picture({ url: 'http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png',
        width: 32, height: 32
      })
      marker.json({
        id: spot.id,
        title: spot.title
      })
    end
  end
end
