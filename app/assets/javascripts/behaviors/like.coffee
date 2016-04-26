App.registerBehavior('Like')

class Behavior.Like extends Behavior.Ashared
  constructor: ->
    fn = @submit
    $('.like-click, .star-click').unbind('click')
    $('.like-click, .star-click').bind('click', (fn), ->
      data =
        action: $(this).data('action')
        type: 'PUT'
        data:
          tag: $(this).data('tag')
      fn(data)
    )
