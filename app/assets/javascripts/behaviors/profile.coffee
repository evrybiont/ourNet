App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @onUserTypeSelect @submit

  onUserTypeSelect: (fnSubmit) ->
    $(document).on('change', '#user_type', (e) ->
      fnSubmit $(this)
    )
