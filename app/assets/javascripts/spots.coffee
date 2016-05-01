# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder
  #override create_marker method
  create_marker: ->
    options = _.extend @marker_options(), @rich_marker_options()
    @serviceObject = new RichMarker options #assign marker to @serviceObject

  rich_marker_options: ->
    marker = document.createElement("div")
    marker.setAttribute 'class', 'marker_container'
    { content: marker }

  # override method
  create_infowindow: ->
    return null unless _.isString @args.infowindow
    $('#dialog-star').find('.body-dialog p.top').html(@args.title)
    $('#dialog-star').find('.body-dialog p.description').html(@args.infowindow)
    return null

#    boxText = document.createElement("div")
#    boxText.setAttribute('class', 'marker_container') #to customize
#    boxText.innerHTML = @args.infowindow
#    @infowindow = new InfoBox(@infobox(boxText))
#
#  # add @bind_infowindow() for < 2.1
#
#  infobox: (boxText)->
#    content: boxText
#    pixelOffset: new google.maps.Size(-140, 0)
#    boxStyle:
#      width: "280px"

@buildMap = (markers) ->
  handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} } #dependency injection

  #then standard use
  handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
    markers = handler.addMarkers(markers)
    handler.bounds.extendWith(markers)
    handler.fitMapToBounds()

    setTimeout ->
      modal = {}

      modal.hide = ->
        $('#overlay').fadeOut()
        $('.dialog').fadeOut()
      $('.marker_container').click ->
        modal.id = '#dialog-star'
        $('#overlay').fadeIn()
        $(modal.id).fadeIn()
      $('.ok-dialog').click ->
        modal.hide()
      $('#overlay').click ->
        if $(modal.id).hasClass('modal')
        else
          modal.hide()
      $('.dialog').click ->
        event.stopPropagation()
    , 1000

