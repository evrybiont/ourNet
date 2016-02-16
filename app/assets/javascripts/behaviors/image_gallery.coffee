App.registerBehavior('ImageGallery')

class Behavior.ImageGallery extends Behavior.Ashared
  constructor: ()->
    $('#projector').knack(data: $('#projector').data('data'))
