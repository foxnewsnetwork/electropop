class Electropop.CardRoute extends Ember.Route with Electropop.Scrolling
  model: (params) ->
    project = @store.find 'project', @generate_expo_id params.raw_id
    {
      project: project,
      card: @generate_card_id(params.raw_id),
      params: params
    }
  generate_expo_id: (raw_id) ->
    parseInt raw_id.split("-")[0]
  generate_card_id: (raw_id) ->
    parseInt raw_id.split('-').slice(1).join('-')
  afterModel: (model, transition) ->
    @bindScrolling()
    @manage_redirect model.params

  manage_redirect: (params) ->
    if 0 is @generate_card_id params.raw_id
      @transitionTo 'expo', @generate_expo_id params.raw_id

  transition_anime: ->
    $('main').effect
      effect: 'slide',
      direction: 'down',
      duration: 400 

  scrolled: (scrolldata) ->
    console.log scrolldata
    

  actions:
    willTransition: (transition) ->
      @unbindScrolling()
      @transition_anime()
      true