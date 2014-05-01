class Electropop.ExpoRoute extends Ember.Route
  model: (params)->
    @store.find 'project', params.expo_id

  actions:
    willTransition: (transition) ->
      $('main').effect
        effect: 'slide',
        direction: 'down',
        duration: 400
      true