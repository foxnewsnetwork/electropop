mixin Electropop.Scrolling
  bindScrolling: (opts) ->
    opts ?= { debounce: 100 }
    $(document).bind 'touchmove', (e) => @touchmoved e
    $(window).bind 'mousewheel', (e) => @mousewheeled e
  unbindScrolling: ->
    $(document).unbind 'touchmove'
    $(window).unbind 'mousewheel'


