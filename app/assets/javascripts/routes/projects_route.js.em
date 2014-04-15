class Electropop.ProjectsRoute extends Ember.Route
  setupController: (controller, projects) ->
    controller.set_projects projects
  model: (params) ->
    [
      {
        title: "Project 1",
        permalink: 1,
        tagline: "We did stuff"
      },
      {
        title: "Project 2",
        permalink: 2,
        tagline: "We did other stuff"
      },
      {
        title: 'Roulette',
        permalink: 3,
        tagline: "Random"
      }
    ]
