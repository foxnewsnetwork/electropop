#= require jquery
#= require jquery_ujs
#= require jquery.ui.effect.all
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require electropop

# for more details see: http://emberjs.com/guides/application/
window.Electropop = Ember.Application.create()
window.Electropop.ApplicationAdapter = DS.FixtureAdapter;
$('.no-script').hide()
