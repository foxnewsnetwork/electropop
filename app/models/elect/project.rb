# == Schema Information
#
# Table name: elect_projects
#
#  id           :integer          not null, primary key
#  permalink    :string(255)
#  title        :string(255)
#  tagline      :string(255)
#  description  :text
#  purpose      :string(255)
#  project_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Elect::Project < ActiveRecord::Base
  FolderTypes = [
    :hobby_projects,
    :work_projects,
    :nsfw_projects,
    :about_projects
  ].freeze

  self.table_name = 'elect_projects'
  has_many :languages,
    class_name: 'Elect::Language'
  has_many :backends,
    -> { backend },
    class_name: 'Elect::Framework'
  has_many :frontends,
    -> { frontend },
    class_name: 'Elect::Framework'
  has_many :external_links,
    class_name: 'Elect::ExternalLink'

  before_create :_create_permalink

  private
  def _create_permalink
    self.permalink ||= self.title.truncate(64).to_url
  end
end
