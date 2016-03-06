App.registerBehavior('Crop')

class Behavior.Crop
  constructor: ->
    $('#crop_btn').bind('click', ->
      $('.spinner-wrap').show()
    )
