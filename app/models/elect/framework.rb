# == Schema Information
#
# Table name: elect_frameworks
#
#  id             :integer          not null, primary key
#  project_id     :integer
#  framework_type :string(255)
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Elect::Framework < ActiveRecord::Base
  FrameworkTypes = ['backend','frontend'].map(&:freeze).freeze
  self.table_name = 'elect_frameworks'
  belongs_to :project,
    class_name: 'Elect::Project'

  scope :backend,
    -> { where "#{self.table_name}.framework_type = ?", :backend }

  scope :frontend,
    -> { where "#{self.table_name}.framework_type = ?", :frontend }
end
