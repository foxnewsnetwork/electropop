mixin Electropop.Scrolling
  bindScrolling: (opts) ->
    opts ?= { debounce: 100 }
    $(document).bind 'touchmove', @scrolled
    $(window).bind 'scroll', @scrolled
  unbindScrolling: ->
    $(document).unbind 'touchmove'
    $(window).unbind 'scroll'


