window.addEventListener 'load', ->
  if window.File and window.FileReader and window.FileList and window.Blob
  else
    alert 'The File APIs are not fully supported in this browser.'
  return

window.App ||= {}
window.Behavior ||= {}

Elemental.addNamespace(App)

$(document).ready ->
  Elemental.load document
  window.wiselinks = new Wiselinks($('.stuff'))

  $(document).off('page:done').on(
    'page:done'
    (event, $target, status, url, data) ->
      tag = $(".stuff").find("[data-behavior]")

      if tag.length
        new Behavior[tag.data('behavior')]
    )

$ ->
  $('a').bind 'ajax:error', (event, jqXHR, ajaxSettings, thrownError) ->
    if jqXHR.status == 401
      $('.row.menu').remove()
