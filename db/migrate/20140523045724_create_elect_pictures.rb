class CreateElectPictures < ActiveRecord::Migration
  def change
    create_table :elect_pictures do |t|
      t.references :project, index: true
      t.string :name
      t.timestamps
    end
  end
end
