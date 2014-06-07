class Electropop.ScrollCatcherComponent extends Ember.Component with Electropop.Scrolling
  mousewheel_threshold: 2
  willInsertElement: ->
    @reset_count()
    @bindScrolling()
  willDestroyElement: ->
    @unbindScrolling()
  reset_count: ->
    @set('scroll_count', 0)
  mousewheeled: (e) ->
    if 0 > e.deltaY
      @scroll_down()
    else
      @scroll_up()
  scroll_up: ->
    if @get('scroll_direction') is 'down'
      @reset_count()
    @set 'scroll_direction', 'up'
    @incrementProperty 'scroll_count'

  scroll_down: ->
    if @get('scroll_direction') is 'up'
      @reset_count()
    @set 'scroll_direction', 'down'
    @decrementProperty 'scroll_count'

  peicewise_linear: (x) ->
    return 0 if x < 0
    return 100 if x >= @mousewheel_threshold
    (100 / @mousewheel_threshold) * x

  +computed visible
  visibility_class: ->
    if @get('visible')
      'visible'
    else
      'fading'

  +observer scroll_count
  manage_visibility: ->
    if @get('direction') is @get('scroll_direction')
      @set('visible', true)
      cb = =>
        @set 'visible', false
      setTimeout cb, 2000
    else
      @set('visible', false)
  +computed direction, scroll_count, scroll_direction
  completion: ->
    if @get('direction') is @get('scroll_direction')
      @peicewise_linear Math.abs @get 'scroll_count'
    else
      0
  +computed completion
  width: ->
    "width: " + @get('completion') + "%"

  +observer scroll_count
  transition_card: ->
    if -@mousewheel_threshold > @get('scroll_count')
      @get('controller').sendAction 'cardDown'
      @reset_count()
    if @mousewheel_threshold < @get('scroll_count')
      @get('controller').sendAction 'cardUp'
      @reset_count()
  touchmoved: (scrolldata) ->
