class Electropop.ProjectController extends Ember.ObjectController
  +computed model
  active_project: ->
    @get('model')
  +computed
  projects: -> 
    @store.find 'project'
  +computed active_project.id
  permalink: ->
    @get('active_project.id')
  +computed active_project.title
  title: ->
    @get('active_project.title')