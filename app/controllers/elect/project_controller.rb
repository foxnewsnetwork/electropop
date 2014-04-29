class Elect::ProjectController < ApplicationController
  respond_to :json
  expose(:project) { _project }
  def show
    respond_with project
  end
  private
  def _project
    {
      project: {
        id: params[:id],
        permalink: Faker::Lorem.sentence.to_url,
        title: Faker::Company.name,
        tagline: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        pic: 'images/ruby.png',
        purpose: 'Showcasing CSS',
        source: 'foxnewsnetwork.github.io',
        backend: ['Ruby on Rails', 'Redis'],
        frontend: ['Emberjs', 'Bootstrap', 'Compass']
      }
    }
  end
end