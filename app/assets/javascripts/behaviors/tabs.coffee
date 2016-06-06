App.registerBehavior('Tabs')

class Behavior.Tabs
  constructor: ->
    $('.utabs a').click (e) ->
      $('.utabs .tablink').removeClass('display')
      e.target.classList.add('display')
      id_name = e.target.innerHTML.toLocaleLowerCase()
      $('.tabcontent .twelve').addClass('hd')
      $('#' + id_name).removeClass('hd')
