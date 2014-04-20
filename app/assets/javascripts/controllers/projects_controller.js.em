class Electropop.ProjectsController extends Ember.ArrayController
  +computed @each
  projects: ->
    @get('model')
  
  