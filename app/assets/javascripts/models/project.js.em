a = DS.attr
class Electropop.Project extends DS.Model
  title: a 'string'
  permalink: a 'string'
  tagline: a 'string'
  description: a 'string'
  pic: a 'string'
  purpose: a 'string'
  source: a 'string'
  backends: a()
  frontends: a()
  languages: a()
  type: a 'string'
