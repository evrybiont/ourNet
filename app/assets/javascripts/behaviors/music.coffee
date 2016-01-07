App.registerBehavior('Music')

class Behavior.Music extends Behavior.Ashared
  constructor: (@action) ->
    data = {action: @action, type: 'GET'}
    @submit(data, PL.set)
