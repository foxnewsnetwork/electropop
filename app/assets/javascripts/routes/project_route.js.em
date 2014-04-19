class Electropop.ProjectRoute extends Ember.Route
  setupController: (controller, projects) ->
    controller.set_projects projects
  model: (params) ->
    