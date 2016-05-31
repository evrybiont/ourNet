App.registerBehavior('Flash')

class Behavior.Flash
  constructor: (delay) ->
    console.log('msg delay time is - ' + delay)
    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), delay || 4000
