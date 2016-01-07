App.registerBehavior('Ashared')

class Behavior.Ashared
  onBeginError: (response) =>
    console.log response

  submit: (data, fn=null) ->
    $.ajax(
      url: data.action
      type: data.type
      #data: el.serialize()
      success: (resp) =>
        if typeof fn == 'function'
          fn resp
      error: @onBeginError
    )
