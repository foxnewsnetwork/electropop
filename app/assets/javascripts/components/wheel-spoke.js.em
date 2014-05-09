class Electropop.WheelSpokeComponent extends Ember.Component
  +computed spoke_type
  clickable: ->
    @get('spoke_type') isnt 'folder'
  +computed spoke.tagline
  tagline: -> @get 'spoke.tagline'
  +computed spoke.title
  title: -> @get 'spoke.title'
  +computed spoke.permalink
  permalink: -> @get 'spoke.permalink'
  +computed spoke.visibility, spoke.activity, alignment
  css_classes: ->
    "wheel-spoke #{@get 'spoke.visibility'} #{@get 'spoke.activity'} alignment-#{@get 'alignment'} spoke-#{@get 'spoke_type'}"
  +computed spoke.type
  spoke_type: ->
    @get('spoke.type') || 'blank'
  +computed spoke_type
  fa_class: ->
    return 'fa-folder' if @get('spoke_type') is 'folder'
    return 'fa-github-alt' if @get('spoke_type') is 'project'
    'fa-question-circle'
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


    