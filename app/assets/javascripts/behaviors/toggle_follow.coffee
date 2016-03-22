App.registerBehavior('ToggleFollow')

class Behavior.ToggleFollow extends Behavior.Ashared
  constructor: ->
    @update(@submit)
  update: (fn) ->
    $('.toggle_follow').unbind('click')
    $('.toggle_follow').bind('click', ->
      data =
        action: $(this).data('action')
        type: 'PUT'
        data:
          page: $(this).data('page')
          uid: $(this).data('uid')
      fn(data)
    )
