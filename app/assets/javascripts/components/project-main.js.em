class Electropop.ProjectMainComponent extends Ember.Component
  +computed project.id
  permalink: ->
    @get('project.id')
  +computed project.title
  title: ->
    @get('project.title')

  +computed project.languages
  languages: ->
    @get('project.languages')