App.registerBehavior('Flash')

class Behavior.Flash extends Behavior.Ashared
  constructor: ->
    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), 3000
