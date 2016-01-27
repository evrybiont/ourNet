App.registerBehavior('Music')

class Behavior.Music extends Behavior.Ashared
  constructor: ->
    @data =
      action: $('.music-container').data('action')
      type: $('.music-container').data('type')
      data:
        dir: $('.music-container').data('dir')
    @onBeginAllMusic()

  onBeginAllMusic: ->
    @submit(@data, PL.set)
