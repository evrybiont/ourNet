App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @onNameInput @submit

  onNameInput: (fnSubmit) ->
    $(document).on('click', '#save_name', (e) ->
      data = {
        action: $('#setting').data('action'),
        type: $('#setting').data('type'),
        data: $('#name').serialize()
      }

      fnSubmit data
    )
