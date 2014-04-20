class Electropop.ProjectController extends Ember.ObjectController
  +computed model.permalink, model.projects.@each
  active_project: ->
    ps = @projects.filter (project) =>
      @get('model.permalink')? && project.get('permalink') is @get('model.permalink')
    ps.objectAt 0
  +computed model.projects.@each
  projects: -> 
    @get('model.projects')

