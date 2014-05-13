class CreateElectExternalLinks < ActiveRecord::Migration
  def change
    create_table :elect_external_links do |t|
      t.references :project, index: true
      t.string :href
      t.string :name
      t.timestamps
    end
  end
end
