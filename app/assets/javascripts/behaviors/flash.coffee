App.registerBehavior('Flash')

class Behavior.Flash extends Behavior.Ashared
  constructor: ->
    setTimeout (->
      $('.flash').fadeOut '300'
    ), 5000
