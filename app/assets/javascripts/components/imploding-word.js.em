class Electropop.ImplodingWordComponent extends Ember.Component
  +computed word
  sanity: ->
    "faggot"
  +computed word
  raw_letters: ->
    @get('word').toUpperCase().split ''
  +computed raw_letters
  letters: ->
    @get('raw_letters').map (char) =>
      @_generate_letter_object char
  _generate_letter_object: (char) ->
    letter = new Ember.Object()
    letter.character = char
    letter.index = @_increment_count()
    letter
  _increment_count: ->
    (@count ||= 0)
    @count++