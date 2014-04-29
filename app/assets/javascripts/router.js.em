# For more information see: http://emberjs.com/guides/routing/

Electropop.Router.map ()->
  @resource 'projects'
  @resource 'project', path: 'project/:project_id'
  @resource 'expo', path: 'expo/:expo_id'
  @resource 'card', path: 'card/:raw_id'


