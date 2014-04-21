class Electropop.ExpoController extends Ember.ObjectController
  +computed model
  title: ->
    @get('model.title')