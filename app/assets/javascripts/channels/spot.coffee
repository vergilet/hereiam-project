return null if $('#map').length
App.spot = App.cable.subscriptions.create { channel: "SpotChannel", spot_id: location.pathname.replace('/spots/', '') },
  connected: (data) ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    App.spot.speak event.target.value
    event.target.value = ''
    event.preventDefault()