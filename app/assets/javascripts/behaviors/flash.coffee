App.registerBehavior('Flash')

class Behavior.Flash
  constructor: (delay) ->
    if Number.isInteger(delay)
      time = delay
      console.log('msg delay time is - ' + time)

    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), time || 4000
