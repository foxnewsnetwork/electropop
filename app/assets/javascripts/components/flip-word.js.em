class Electropop.FlipWordComponent extends Ember.Component
  tagName: 'li'
  animationClasses: ['transition-in', 'on-display', 'transition-out']
  didInsertElement: ->
    @$().hide()
    @chain_timeouts()
  my_timeout: (t, cb) ->
    setTimeout cb, 1000 * t
  display_delay: ->
    0.6
  transition_delay: ->
    3
  offset_delay: ->
    4.7 * parseInt @get 'ccs'
  promise_to_run: (t, anime) ->
    new Ember.RSVP.Promise (resolve) =>
      @my_timeout t, -> resolve anime()
  chain_timeouts: ->
    p = @promise_to_run @offset_delay(), =>
      @$().show()
      @$().addClass 'transition-in'
    if 3 is parseInt @get 'ccs'
      throw NotImplemented
    p2 = p.then ($el) =>
      @promise_to_run @display_delay(), ->
        $el.removeClass('transition-in').addClass 'on-display'
      p2.then ($el) =>
        @promise_to_run @transition_delay(), ->
          $el.removeClass
    p3 = p2.then ($el) =>
      @promise_to_run @display_delay(), ->
        $el.removeClass('on-display').addClass('transition-out')
    p3.then ($el) =>
      @promise_to_run @display_delay(), ->
        $el.hide(500)
    