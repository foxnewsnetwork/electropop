class Electropop.ProjectsRoute extends Ember.Route
  model: (params) ->
    @store.find 'project'
  actions:
    cardUp: ->
      console.log 'cardUp Receiveds'
      @transitionTo 'index'
    cardDown: ->
      @transitionTo 'contacts'