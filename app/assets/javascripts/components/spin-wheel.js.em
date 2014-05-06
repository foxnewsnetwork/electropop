class Electropop.SpinWheelComponent extends Ember.Component with Electropop.Scrolling
  cutoff: Math.floor(window.innerHeight / 85) + 1
  willInsertElement: ->
    @bindScrolling()
  willDestroyElement: ->
    @unbindScrolling()

  mousewheeled: (e) ->
    if 0 > e.deltaY
      @wheeldown()
    else
      @wheelup()

  take_bot_spoke: ->
    @$('.wheel div[id^=ember]').last().remove()
  take_top_spoke: ->
    @$('.wheel div[id^=ember]').first().remove()
  wheeldown: ->
    @take_bot_spoke().prependTo @$('.wheel')
  wheelup: ->
    @take_top_spoke().appendTo @$('.wheel')
  +computed models.length
  models_length: ->
    parseInt @get 'models.length'

  +computed cutoff
  midpoint: ->
    Math.floor(@cutoff / 2)
  
  +computed spokes.length
  spokes_count: -> 
    @get('spokes.length')

  +computed models.@each, midpoint
  spokes: ->
    @spin_active_to_midpoint @get("activation_models")
  
  +computed models.@each
  activation_models: ->
    @activate_first_spoke @get 'screensized_models'
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
    o.set 'alignment', 0
    o.set 'visibility', 'shown'
    o
  activate_first_spoke: (spokes) ->
    spokes.map (spoke, ind) =>
      if ind is 0
        spoke.set 'activity', 'active'
      else
        spoke.set 'activity', 'inactive'
      spoke
  spin_active_to_midpoint: (spokes) ->
    @rotate_array spokes, @midpoint + 1
  manage_screensize: (array) ->
    if 0 < array.length && array.length < @cutoff
      @manage_screensize $.merge(array, @deep_clone array)
    else
      array.slice(0,@cutoff)
  deep_clone: (objects) ->
    $.map objects, (object) => @to_hashes(object)
    
  rotate_array: (array, amount_right) ->
    if amount_right < 0
      head = array.splice(0, -amount_right)
      array.map (element) -> head.push element
      head
    else
      tail = array.splice(amount_right)
      tail.map (element) -> array.unshift element
      array
  
