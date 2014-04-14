class Electropop.SpinWheelComponent extends Ember.Component
  anime_count: 0
  +computed cutoff
  midpoint: ->
    Math.floor @cutoff / 2
  +computed
  cutoff: ->
    Math.floor window.innerHeight / 85
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
    ss0 = $.map models, @to_hashes
    ss1 = @manage_screensize ss0
    ss2 = @manage_visibility ss1
    ss3 = @manage_activation ss2
    ss4 = @manage_alignment ss3
  manage_animation: (spokes) ->
    spokes = spokes.map (spoke, ind) =>
      spoke.anime_count = @get('anime_count')
      spoke.anime_delay = ind
      spoke
    spokes
  manage_alignment: (spokes) ->
    spokes.map (spoke, ind) =>
      spoke.alignment = @parametrized_arc ind
      spoke
  parametrized_arc: (y) ->
    midpoint = @midpoint
    (y - midpoint) * (y - midpoint)
  manage_activation: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind == @midpoint
        spoke.activity = 'active'
      else
        spoke.activity = 'inactive'
      spoke
  manage_visibility: (spokes) ->
    spokes.map (spoke, ind) =>
      if 0 < ind && ind < @cutoff - 1
        spoke.visibility = 'shown' 
      else
        spoke.visibility = 'hidden'
      spoke
  manage_screensize: (array) ->
    if array.length < @cutoff
      @manage_screensize $.merge(array, @deep_clone array)
    else
      array
  deep_clone: (object) ->
    $.extend true, {}, object
  rotleft_array: (array) ->
    tail = array.slice(1)
    tail.push array[0]
    tail
  actions:
    test: ->
      @set 'anime_count', 1 + @get 'anime_count'
      @set 'models', @rotleft_array @get 'models'
