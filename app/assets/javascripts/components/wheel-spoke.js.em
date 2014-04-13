class Electropop.WheelSpokeComponent extends Ember.Component
  +computed spoke.visibility, spoke.activity, alignment
  css_classes: ->
    "wheel-spoke #{@get 'spoke.visibility'} #{@get 'spoke.activity'} alignment-#{@get 'alignment'}"
  +computed spoke.alignment
  alignment: ->
    a = 5 * @get('spoke.alignment')
    console.log a
    a
    