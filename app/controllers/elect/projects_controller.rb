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
        tagline: Faker::Lorem.paragraph
      }
    end
  end
end
