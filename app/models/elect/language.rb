# == Schema Information
#
# Table name: elect_languages
#
#  id         :integer          not null, primary key
#  project_id :integer
#  name       :string(255)
#  percentage :integer
#  created_at :datetime
#  updated_at :datetime
#

class Elect::Language < ActiveRecord::Base
  self.table_name = 'elect_languages'
  belongs_to :project,
    class_name: 'Elect::Project'
end
