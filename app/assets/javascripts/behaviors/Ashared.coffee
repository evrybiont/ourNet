App.registerBehavior('Ashared')

class Behavior.Ashared
  onBeginError: (response) =>
    console.log response

  submit: (el, data=null) ->
    $.ajax(
      url: data.action || el.data('action')
      type: data.type || el.data('type')
      data: el.serialize()
      error: @onBeginError
    )
