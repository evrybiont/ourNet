App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @onUserTypeSelect @submit
    @onNameInput @submit

  onUserTypeSelect: (fnSubmit) ->
    $(document).on('change', '#type', (e) ->
      fnSubmit($(this), $('#setting').data())
    )

  onNameInput: (fnSubmit) ->
    $(document).on('click', '#save_name', (e) ->
      fnSubmit($('#name'), $('#setting').data())
    )
