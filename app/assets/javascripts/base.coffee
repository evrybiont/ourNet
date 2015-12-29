window.addEventListener 'load', ->
  if window.File and window.FileReader and window.FileList and window.Blob
  else
    alert 'The File APIs are not fully supported in this browser.'
  $('#files').change handleMultipleSelect
  return

handleMultipleSelect = (e) ->
  PL.set e.target.files
  return

window.App ||= {}
window.Behavior ||= {}

#App.init = ->

#$(document).on "page:change", ->
#App.init()
