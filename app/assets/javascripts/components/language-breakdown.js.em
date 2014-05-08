class Electropop.LanguageBreakdownComponent extends Ember.Component
  bar_classes: ['progress-bar-danger' , 'progress-bar-warning' , 'progress-bar-info' , 'progress-bar-success']
  +computed language.name
  name: ->
    @get('language.name')
  +computed name
  color_class: ->
    return 'progress-bar-danger' if @get('name') is 'ruby'
    return 'progress-bar-warning' if @get('name') is 'javascript'
    return 'progress-bar-info' if @get('name') is 'css'
    return 'progress-bar-success' if @get('name') is 'haskell'
    @random_color_class()
  +computed language.percentage
  percentage: ->
    @get('language.percentage')

  +computed percentage
  width_style: ->
    'width: ' + @get('percentage') + '%;' 

  random_number: (max) ->
    Math.round(Math.random() * 100 * max) % max
  random_color_class: ->
    @bar_classes[@random_number(4)]