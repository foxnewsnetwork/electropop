class Electropop.LanguageCardComponent extends Ember.Component
  +computed language.name
  name: ->
    @get('language.name')
  +computed name
  language_class: ->
    ((@get('name') || 'blank') + "-card").toLowerCase()