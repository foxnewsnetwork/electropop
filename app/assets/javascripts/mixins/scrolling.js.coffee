Electropop.Scrolling = Ember.Mixin.create
  bindScrolling: (opts) ->
    opts ?= { debounce: 100 }
    cb = => @scrolled()
    if opts.debounce?
      onScroll = Electropop.debounce cb, opts.debounce
    else
      onScroll = cb
    $(document).bind 'touchmove', onScroll
    $(window).bind 'scroll', onScroll

  unbindScrolling: ->
    $(window).unbind 'scroll'
    $(document).unbind 'touchmove'


