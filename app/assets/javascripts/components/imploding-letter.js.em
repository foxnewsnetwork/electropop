class Electropop.ImplodingLetterComponent extends Ember.Component
  FunCharacters: ['◇', '△', '▽', '♢', '»', '«','♤', '♧', '♡', '❦', '☙','♔','♘','☆','☯','🌜','⚔']
  +computed letter.character
  character: ->
    k = @get('letter.character')
    if k is " " || !k?
      @_random_fun_character()
    else
      k

  +computed letter.index
  index: ->
    @get('letter.index')

  didInsertElement: ->
    @_implode_callback =>
      @$('.imploding-letter').show 
        effect: 'puff'
        duration: 370
        complete: -> $(@).hide()

  _implode_callback: (callback) ->
    setTimeout callback, @get('_delay_time')

  +computed index
  _delay_time: ->
    375 * parseInt @get('index')

  _random_fun_character: ->
    @FunCharacters[@_rand()]

  _rand: ->
    Math.round(Math.random() * 999) % @FunCharacters.length
