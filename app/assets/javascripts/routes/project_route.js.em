class Electropop.ProjectRoute extends Ember.Route
  model: (params) ->
    @store.find 'project', params.project_id