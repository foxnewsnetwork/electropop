class Electropop.CardRoute extends Ember.Route
  model: (params) ->
    @set('params', params)
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
    @manage_redirect model.params

  manage_redirect: (params) ->
    if 0 is @generate_card_id params.raw_id
      @transitionTo 'expo', @generate_expo_id params.raw_id
    if 5 is @generate_card_id params.raw_id
      @transitionTo 'project', @generate_expo_id params.raw_id
  transition_anime: ->
    $('main').effect
      effect: 'slide',
      direction: 'down',
      duration: 400 
  
  +computed params.raw_id
  expo_id: ->
    @generate_expo_id @get('params.raw_id')

  +computed params.raw_id
  card_id: ->
    @generate_card_id @get 'params.raw_id'

  +computed expo_id, card_id
  previous_card_id: ->
    [@get('expo_id'), @get('card_id') - 1].join('-')
  +computed expo_id, card_id
  next_card_id: ->
    [@get('expo_id'), @get('card_id') + 1].join('-')

  actions:
    cardUp: ->
      @transitionTo 'card', @previous_card_id
    cardDown: ->
      @transitionTo 'card', @next_card_id
    willTransition: (transition) ->
      @transition_anime()
      true
