App.registerBehavior('Spinner')

class Behavior.Spinner
  constructor: ->
    $('.run-spinner').bind('click', ->
      $('.spinner-wrap').show()
    )
