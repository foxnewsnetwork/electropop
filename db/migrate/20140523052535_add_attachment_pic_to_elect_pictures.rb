class AddAttachmentPicToElectPictures < ActiveRecord::Migration
  def self.up
    change_table :elect_pictures do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :elect_pictures, :pic
  end
end
