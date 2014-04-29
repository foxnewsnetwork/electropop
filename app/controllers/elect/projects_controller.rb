class Elect::ProjectsController < ApplicationController
  respond_to :json
  expose(:projects) { _projects }
  def index
    respond_with projects
  end
  private
  def _projects
    (0..9).map do |k|
      {
        id: k,
        permalink: Faker::Lorem.sentence.to_url,
        title: Faker::Company.name,
        tagline: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        pic: 'images/ruby.png',
        purpose: 'Showcasing CSS',
        source: 'foxnewsnetwork.github.io',
        backends: ['Ruby on Rails', 'Redis'],
        frontends: ['Emberjs', 'Bootstrap', 'Compass']
      }
    end
  end
end
