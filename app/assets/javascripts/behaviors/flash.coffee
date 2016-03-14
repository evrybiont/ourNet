App.registerBehavior('Flash')

class Behavior.Flash
  constructor: (delay) ->
    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), delay || 3000
