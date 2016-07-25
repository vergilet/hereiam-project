class @DialogMessage
  modal = {}
  constructor: () ->
    @prepare()
    @bindWithTimeout()

  prepare: ->
    modal.hide = ->
      $('#overlay').fadeOut()
      $('.dialog').fadeOut()

  bind: ->
    $('.marker_container').click ->
      $('#wardModal').modal('show')

  bindWithTimeout: ->
    setTimeout =>
      @bind()
    , 1000
