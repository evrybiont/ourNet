App.registerBehavior('Flash')

class Behavior.Flash extends Behavior.Ashared
  constructor: (delay) ->
    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), delay || 3000
