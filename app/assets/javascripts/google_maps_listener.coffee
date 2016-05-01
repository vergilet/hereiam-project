class @GoogleMapsListener

  maxZoomLevel = 18

  constructor: (@handler) ->

  zoom_changed: ->
    google.maps.event.addListener @handler.getMap(), 'zoom_changed', () =>
      if (@handler.getMap().getZoom() > maxZoomLevel)
        @handler.getMap().setZoom(maxZoomLevel)