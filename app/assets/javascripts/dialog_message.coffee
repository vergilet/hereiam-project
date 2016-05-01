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

  bindWithTimeout: ->
    setTimeout =>
      @bind()
    , 1000
