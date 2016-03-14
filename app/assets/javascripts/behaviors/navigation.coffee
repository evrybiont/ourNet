App.registerBehavior('Navigation')

class Behavior.Navigation extends Behavior.Ashared
  constructor: ->
    $('.super').on('click', ->
      console.log 'e'
      clearInterval(window.fnInterval)
      setTimeout(@initLoop, 300)
    )
    setTimeout(@initLoop, 300)

  goBack: =>
    console.log(window.location.href)
    actions = ['/dashboards']
    data =
      action: window.location.href
      type: 'GET'
      data: null

    @submit data

  initLoop: =>
    href = window.location.href

    window.fnInterval = setInterval (=>
      console.log('running')
      if window.location.href != href
        @goBack()
        clearInterval(window.fnInterval)
    ), 100
