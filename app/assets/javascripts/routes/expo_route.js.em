class Electropop.ExpoRoute extends Ember.Route
  model: (params)->
    @store.find 'project', params.expo_id