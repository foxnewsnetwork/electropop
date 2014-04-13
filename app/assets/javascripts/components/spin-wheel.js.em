class Electropop.SpinWheelComponent extends Ember.Component
  +computed cutoff
  midpoint: ->
    Math.floor @cutoff / 2.5
  +computed
  cutoff: ->
    Math.floor window.innerHeight / 100
  +computed models
  spokes: ->
    @to_spokes @models
  take_top: ->
    spoke = @get_first_spoke()
    @kill_first_spoke()
    spoke
  get_first_spoke: ->
    @$('.wheel-spoke:first-child').html()
  kill_first_child: ->
    @$('.wheel-spoke:first-child').remove()
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
  manage_alignment: (spokes) ->
    spokes.map (spoke, ind) =>
      spoke.alignment = @parametrized_arc ind
      spoke
  parametrized_arc: (y) ->
    (y - @midpoint) * (y - @midpoint)
  manage_activation: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind == @midpoint
        spoke.activity = 'active'
      else
        spoke.activity = 'inactive'
      spoke
  manage_visibility: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind + 1 < @cutoff
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
  actions:
    test: ->
      