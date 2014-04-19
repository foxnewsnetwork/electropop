class Electropop.SpinWheelComponent extends Ember.Component
  anime_count: 0
  +computed cutoff
  midpoint: ->
    m = Math.floor(@cutoff / 2)
    console.log m
    m
  +computed
  cutoff: ->
    Math.floor(window.innerHeight / 90) - 1
  +computed models, anime_count
  spokes: ->
    spokes = @to_spokes @models
    spokes = @manage_animation spokes if @get('anime_count') > 0
    spokes
  to_hashes: (model) ->
    permalink: model.permalink
    title: model.title
    tagline: model.tagline
  to_spokes: (models) ->
    @manage_alignment @manage_visibility @manage_activation @manage_screensize $.map models, @to_hashes    
  manage_animation: (spokes) ->
    spokes = spokes.map (spoke, ind) =>
      spoke.anime_count = @get('anime_count')
      spoke.anime_delay = ind + 1
      spoke
    spokes
  manage_alignment: (spokes) ->
    spokes.map (spoke, ind) =>
      spoke.alignment = @parametrized_arc ind
      spoke
  parametrized_arc: (y) ->
    midpoint = @midpoint
    (y - midpoint) * -5 # (y - midpoint)
  activate_first_spoke: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind is 0
        spoke.activity = 'active'
      else
        spoke.activity = 'inactive'
      spoke
  spin_active_to_midpoint: (spokes) ->
    @rotate_array spokes, @midpoint+1
  manage_activation: (spokes) ->
    @spin_active_to_midpoint @activate_first_spoke spokes
  manage_visibility: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind < @cutoff
        spoke.visibility = 'shown' 
      else
        spoke.visibility = 'hidden'
      spoke
  manage_screensize: (array) ->
    if array.length < @cutoff
      @manage_screensize $.merge(array, @deep_clone array)
    else
      array.slice(0,@cutoff)
  deep_clone: (object) ->
    $.extend true, {}, object
  rotate_array: (array, amount_right) ->
    if amount_right < 0
      head = array.splice(0, -amount_right)
      array.map (element) -> head.push element
      head
    else
      tail = array.splice(amount_right)
      tail.map (element) -> array.unshift element
      array
  # Why isn't the above method better written?
  # Why isn't the bottom method implemented as a special case of the top method?
  # Because it's javascript and trying to be clever with javascript
  # is like going for MENSA when you're retarded because your parents are related
  rotleft_array: (array) ->
    tail = array.slice(1)
    tail.push array[0]
    tail
  slice: (array, i1, i2) ->
    @deep_clone array.slice(i1, i2)
  actions:
    test: ->
      @set 'anime_count', 1 + @get 'anime_count'
      @set 'models', @rotleft_array @get 'models'
