App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @onNameInput @submit

  onNameInput: (fnSubmit) ->
    $('#save_name').unbind('click')
    $('#save_name').bind('click', (e) ->
      data = {
        action: $('#setting').data('action'),
        type: $('#setting').data('type'),
        data: $('#name').serialize()
      }

      fnSubmit data
    )
