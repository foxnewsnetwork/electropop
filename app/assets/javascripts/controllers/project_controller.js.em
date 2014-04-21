class Electropop.ProjectController extends Ember.ObjectController
  +computed model
  active_project: ->
    @get('model')
  +computed
  projects: -> 
    @store.find 'project'
  +computed active_project
  permalink: ->
    p = @get('active_project.id')
    console.log p
    p
  +computed active_project
  title: ->
    t = @get('active_project.title')
    console.log t
    t