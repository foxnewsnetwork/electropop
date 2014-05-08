class Electropop.ProjectController extends Ember.ObjectController
  mouseover: 'everything'
  init: ->
    @_super()
    @bindMouseover()
  willDestroy: ->
    @unbindMouseover()
  bindMouseover: ->
    $('#main-thing').bind 'mouseenter', => @set 'mouseover', 'main'
    $('#side-thing').bind 'mouseenter', => @set 'mouseover', 'everything'
  unbindMouseover: ->
    $('#main-thing').unbind 'mouseenter'
    $('#side-thing').unbind 'mouseenter'
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

  +computed mouseover
  main_space_class: ->

  +computed mouseover
  side_space_class: ->
    if @get('mouseover') is 'main'
      'virtually-invisible'
