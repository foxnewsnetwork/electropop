class Electropop.ProjectsController extends Ember.ArrayController
  +computed @each
  projects: ->
    console.log @get 'model'
    @get('model').content
  
  