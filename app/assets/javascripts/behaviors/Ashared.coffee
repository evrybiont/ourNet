App.registerBehavior('Ashared')

class Behavior.Ashared
  onBeginError: (response) =>
    console.log response

  submit: (el) ->
    $.ajax(
      url: el.data('action')
      type: el.data('type')
      data: el.serialize()
      error: @onBeginError
    )
