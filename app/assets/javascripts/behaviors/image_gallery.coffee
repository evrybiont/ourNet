App.registerBehavior('ImageGallery')

class Behavior.ImageGallery
  constructor: ()->
    setTimeout (->
      $('#projector').knack(data: $('#projector').data('data'))
    ), 1500
