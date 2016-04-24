App.registerBehavior('Flash')

class Behavior.Flash
  constructor: (delay) ->
    if delay
      time = delay.data('time')

    console.log('msg delay time is - ' + time)
    setTimeout (->
      $('.flash-message').fadeOut '300'
    ), time || 3000
