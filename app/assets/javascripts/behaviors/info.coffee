App.registerBehavior('Info')

class Behavior.Info
  constructor: ->
    user_is = $('#info-msg').data('user')
    unless user_is
      $('.info-msg').click (e) ->
        e.stopPropagation()
        e.preventDefault()
        msg = '<div class="row flash-message">' +
              '<div class="alert alert-alert gn-c">You need to sign in or sign up before continuing</div>' +
              '</div>'
        $('#flash').html(msg)
        new Behavior.Flash()
        $('html, body').animate({ scrollTop: 0 }, 'slow')
        $('html, body').stop(true, true)
