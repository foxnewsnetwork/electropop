class Electropop.ExpoController extends Ember.ObjectController
  +computed model
  title: ->
    @get('model.title')

  +computed model.id
  project_id: ->
    @get('model.id')

  +computed project_id
  next_card_id: ->
    [@get('project_id'), 1].join '-'