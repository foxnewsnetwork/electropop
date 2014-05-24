# == Schema Information
#
# Table name: elect_pictures
#
#  id               :integer          not null, primary key
#  project_id       :integer
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer
#  pic_updated_at   :datetime
#

class Elect::Picture < ActiveRecord::Base
  self.table_name = 'elect_pictures'
  if Rails.env.test?
    has_attached_file :pic,
      url: '/storage/test_pics/:id/:basename.:extension',
      path: ':rails_root/public/storage/test_pics/:id/:basename.:extension'
  elsif Rails.env.development?
    has_attached_file :pic,
      url: '/storage/dev_pics/:id/:basename.:extension',
      path: ':rails_root/public/storage/dev_pics/:id/:basename.:extension'
  else
    has_attached_file :pic,
      url: '/storage/pics/:id/:basename.:extension',
      path: ':rails_root/public/storage/pics/:id/:basename.:extension'
  end
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  belongs_to :project,
    class_name: 'Elect::Project'

end
