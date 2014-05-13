class Electropop.ProjectsRoute extends Ember.Route
  model: (params) ->
    @store.find 'project'