class Electropop.SpinWheelComponent extends Ember.Component
  anime_count: 0
  +computed cutoff
  midpoint: ->
    m = Math.floor(@cutoff / 2)
    m
  +computed
  cutoff: ->
    Math.floor(window.innerHeight / 90) - 1
  +computed models.@each, anime_count
  spokes: ->
    return @get("animated_models") if @get('anime_count') > 0
    return @get("aligned_models")
  +computed models.@each, anime_count
  animated_models: ->
    @get('aligned_models').map (model, ind) =>
      model.set 'anime_count', @get('anime_count')
      model.set 'anime_delay', ind + 1
      model
  +computed models.@each
  aligned_models: ->
    @get('visible_models').map (model, ind) =>
      model.set 'alignment', @parametrized_arc ind
      model
  +computed models.@each, cutoff
  visible_models: ->
    @get('activation_models').map (model, ind) =>
      if ind < @get('cutoff')
        model.set 'visibility', 'shown'
      else
        model.set 'visibility', 'hidden'
      model
  +computed models.@each
  activation_models: ->
    @spin_active_to_midpoint @activate_first_spoke @get 'screensized_models'
  +computed models.@each
  screensized_models: ->
    @manage_screensize @get 'processed_models'
  +computed models.@each
  processed_models: ->
    @get('models').map @to_hashes
  to_hashes: (model) ->
    o = new Ember.Object()
    o.set 'permalink', model.get('id')
    o.set 'title', model.get('title')
    o.set 'tagline', model.get('tagline')
    o
  parametrized_arc: (y) ->
    midpoint = @midpoint
    (y - midpoint) * (y - midpoint)
  activate_first_spoke: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind is 0
        spoke.set 'activity', 'active'
      else
        spoke.set 'activity', 'inactive'
      spoke
  spin_active_to_midpoint: (spokes) ->
    @rotate_array spokes, @midpoint+1
  manage_screensize: (array) ->
    if 0 < array.length && array.length < @cutoff
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
