class Electropop.ProjectsRoute extends Ember.Route
  setupController: (controller, projects) ->
    controller.set_projects projects
  model: (params) ->
    [
      {
        title: 'Roulette',
        permalink: 3,
        tagline: "Random"
      },
      {
        title: "Project 2",
        permalink: 2,
        tagline: "We did other stuff"
      },
      {
        title: "Project 3",
        permalink: 3,
        tagline: "We did stuff"
      }
    ]
