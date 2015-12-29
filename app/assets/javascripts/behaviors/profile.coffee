App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @init_user_type()

  init_user_type: ->
    $(document).on('change', '#user_type', (e) ->
      alert 'change'
    )

$(document).on 'page:change', ->
  return unless $('.profiles.show').length > 0
  new App.Profile
