# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

params = {
  title: 'Electropop',
  tagline: 'Another iteration of my running profile page',
  description: 'Designed after this one vocaloid music video, this project is my long overdue overhaul of my blog page.',
  purpose: 'To create an overly designed and electrifying profile page that is cool but intimidating to use',
  project_type: :hobby_projects
}
params[:description] += " Tool chain used include Ruby on Rails on backend."
params[:description] += " Emberjs, sass compass, jquery, three, and bootstrap on the frontend."
params[:description] += " Animations are almost all css3 with a touch of jQuery UI and three-driven canvas."
project = Elect::Project.create! params

frameworks = []
params = {
  project: project,
  framework_type: 'backend',
  name: 'Ruby on Rails'
}
frameworks.push Elect::Framework.create! params
params = {
  project: project,
  framework_type: 'backend',
  name: 'Redis'
}
frameworks.push Elect::Framework.create! params
params = {
  project: project,
  framework_type: 'frontend',
  name: 'Bootstrap'
}
frameworks.push Elect::Framework.create! params
params = {
  project: project,
  framework_type: 'frontend',
  name: 'EmberJS'
}
frameworks.push Elect::Framework.create! params
params = {
  project: project,
  framework_type: 'frontend',
  name: 'Compass'
}
frameworks.push Elect::Framework.create! params

languages = []
params = {
  project: project,
  name: 'Ruby',
  percentage: 20
}
languages.push Elect::Language.create! params
params = {
  project: project,
  name: 'Emberscript',
  percentage: 65
}
languages.push Elect::Language.create! params
params = {
  project: project,
  name: 'SCSS',
  percentage: 15
}
languages.push Elect::Language.create! params

links = []
params = {
  project: project,
  href: 'github.com/foxnewsnetwork/electropop',
  name: 'github'
}
links.push Elect::ExternalLink.create! params