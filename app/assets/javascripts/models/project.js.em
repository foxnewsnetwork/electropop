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

Electropop.Project.FIXTURES = []
Electropop.Project.FIXTURES.push
  id: 1
  title: 'Electropop Project'
  permalink: 'electropop-project'
  tagline: 'This somewhat electrifying cover-page site for myself.'

Electropop.Project.FIXTURES.push
  id: 2
  title: 'Fox Yam eMerchant'
  permalink: 'fox-yam-e-merchant'
  tagline: 'International trade software designed to allow commodity and materials merchants to work on the go.'

Electropop.Project.FIXTURES.push
  id: 3
  title: 'Global Trade Payment Co.'
  permalink: 'global-trade-payment-co'
  tagline: 'Internet-based escrow for large trade payments.'
