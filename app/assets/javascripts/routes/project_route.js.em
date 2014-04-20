class Electropop.ProjectRoute extends Ember.Route
  setupController: (controller, model) ->
    controller.set 'model', model
  projects: ->
    @store.find 'project'
  model: (params) ->
    permalink: params.project_id
    projects: @projects()