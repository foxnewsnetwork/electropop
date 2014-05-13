# == Schema Information
#
# Table name: elect_external_links
#
#  id         :integer          not null, primary key
#  project_id :integer
#  href       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Elect::ExternalLink < ActiveRecord::Base
  self.table_name = 'elect_external_links'
  belongs_to :project,
    class_name: 'Elect::Project'
end
