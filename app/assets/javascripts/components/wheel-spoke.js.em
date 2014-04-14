class Electropop.WheelSpokeComponent extends Ember.Component
  +computed spoke.visibility, spoke.activity, alignment
  css_classes: ->
    "wheel-spoke #{@get 'spoke.visibility'} #{@get 'spoke.activity'} alignment-#{@get 'alignment'}"
  +computed spoke.alignment
  alignment: ->
    5 * @get('spoke.alignment')

  +computed spoke.anime_delay
  animation_delay: ->
    50 * @get 'spoke.anime_delay'
  timeout: (time, callback)->
    window.setTimeout callback, time
  didInsertElement: ->
    time = @get('animation_delay')
    slide_opts = 
      direction: 'right'
    return unless time > 0
    @timeout time, =>
      @$('.wheel-spoke').hide 'slide', slide_opts, 300, ->
        $(this).show 'slide', slide_opts, 300


    