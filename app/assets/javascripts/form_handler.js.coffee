class RandomQuote
  constructor: ->

class FormHandler
  constructor: (@options) ->
    $('form').on 'ajax:success', @saved

    $('body, #thanks').on 'click', @showInput

  showInput: (e) =>
    clearTimeout(@inputTimeout)
    $('#input').show()
    $('#thanks').hide()

  saved: =>
    $('#input').hide()
    $('#thanks').show()
    @inputTimeout = setTimeout @showInput, 15000

@FormHandler = FormHandler
