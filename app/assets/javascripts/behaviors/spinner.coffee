App.registerBehavior('Spinner')

class Behavior.Spinner
  constructor: ->

    $('.run-spinner').bind('click', ->
      errors = false
      validate_fields = $('.run-spinner').data('validate')
      if validate_fields && validate_fields.length
        for field in validate_fields
          do ->
            if $(field).val() == ''
              errors = true

      $('.spinner-wrap').show() if !errors
    )
