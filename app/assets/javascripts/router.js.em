# For more information see: http://emberjs.com/guides/routing/

Electropop.Router.map ()->
  @resource 'projects'
  @resource 'project', path: 'project/:project_id'


