App.registerBehavior('Navigation')

class Behavior.Navigation extends Behavior.Ashared
  constructor: ->
    $('.super').on('click', ->
      clearInterval(window.fnInterval)
      setTimeout(@initLoop, 300)
    )
    setTimeout(@initLoop, 300)

  goBack: =>
    console.log('window.location.href')
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
      console.log(window.location.href)
      console.log(href)
      if window.location.href != href
        console.log('go back =========')
        @goBack()
        clearInterval(window.fnInterval)
    ), 100
