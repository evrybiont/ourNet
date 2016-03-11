App.registerBehavior('Profile')

class Behavior.Profile extends Behavior.Ashared
  constructor: ->
    @onNameInput @submit
    @onLocalityInput @submit

  onNameInput: (fnSubmit) ->
    $('#save_name').unbind('click')
    $('#save_name').bind('click', ->
      data = {
        action: $('#setting').data('action'),
        type: $('#setting').data('type'),
        data: {attr: 'Name', name: $('#name').val()}
      }

      fnSubmit data
    )

  onLocalityInput: (fnSubmit) ->
    $('#save_locality').unbind('click')
    $('#save_locality').bind('click', ->
      data = {
        action: $('#setting').data('action'),
        type: $('#setting').data('type'),
        data: {attr: 'Locality', locality: $('#locality').val()}
      }

      fnSubmit data
    )
