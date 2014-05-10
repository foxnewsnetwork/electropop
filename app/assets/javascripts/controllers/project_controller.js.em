class Electropop.ProjectController extends Ember.ObjectController
  +computed model
  active_project: ->
    @get('model')
  +computed
  projects: -> 
    @store.find 'project'

  actions:
    hide_nav: ->
      if $('#templates-project').hasClass('hide-nav')
        $('#templates-project').removeClass('hide-nav')
    show_nav: ->
      unless $('#templates-project').hasClass('hide-nav')
        $('#templates-project').addClass('hide-nav')