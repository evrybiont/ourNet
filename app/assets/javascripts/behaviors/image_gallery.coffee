App.registerBehavior('ImageGallery')

class Behavior.ImageGallery
  constructor: ()->
    $('#projector').knack(data: $('#projector').data('data'))
