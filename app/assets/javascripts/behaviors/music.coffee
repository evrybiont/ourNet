App.registerBehavior('Music')

class Behavior.Music extends Behavior.Ashared
  constructor: ->
    @data =
      action: $('.music-container').data('action')
      type: $('.music-container').data('type')

    dir = $('.music-container').data('dir')

    if dir == 'AllMusic'
      @onBeginAllMusic()

  onBeginAllMusic: ->
    @submit(@data, PL.set)
