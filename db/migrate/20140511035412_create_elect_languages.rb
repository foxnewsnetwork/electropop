class CreateElectLanguages < ActiveRecord::Migration
  def change
    create_table :elect_languages do |t|
      t.references :project, index: true
      t.string :name
      t.integer :percentage
      t.timestamps
    end
  end
end
