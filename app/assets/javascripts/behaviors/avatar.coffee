App.registerBehavior('Avatar')

class Behavior.Avatar extends Behavior.Ashared
  constructor: ->
    $('.male-avatar, .female-avatar, .done').unbind('click')
    $('.male-avatar, .female-avatar, .done').bind('click', ->
      $('#user_avatar').click()
    )

    $('#user_avatar').unbind('change')
    $('#user_avatar').bind('change', (e) ->
      $('#change_avatar').click()
    )
