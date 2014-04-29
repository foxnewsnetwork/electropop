class Electropop.CardController extends Ember.ObjectController
  +computed model.project
  project: ->
    @get('model.project')

  +computed project.id
  project_id: ->
    @get('project.id')

  +computed model.card
  card_id: ->
    parseInt @get('model.card')

  +computed card_id
  next_card: ->
    @get('card_id') + 1

  +computed next_card, project_id
  next_card_id: ->
    [@get('project_id'), @get('next_card')].join '-'

  +computed card_id
  previous_card: ->
    @get('card_id') - 1

  +computed previous_card, project_id
  previous_card_id: ->
    [@get('project_id'), @get('previous_card')].join '-'

  +computed card_id
  show_backend: ->
    @get('card_id') is 1

  +computed card_id
  show_frontend: ->
    @get('card_id') is 2

  +computed card_id
  show_tagline: ->
    @get('card_id') is 3 

  +computed card_id
  show_content: ->
    @get('card_id') is 4