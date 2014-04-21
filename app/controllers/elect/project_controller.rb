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
        tagline: Faker::Lorem.paragraph
      }
    }
  end
end