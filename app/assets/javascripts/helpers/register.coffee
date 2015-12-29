App.registerBehavior = (behaviorName) ->
  App[behaviorName] = (domElement) ->
    new Behavior[behaviorName](domElement)
