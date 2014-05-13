class CreateElectProjects < ActiveRecord::Migration
  def change
    create_table :elect_projects do |t|
      t.string :permalink
      t.string :title
      t.string :tagline
      t.text :description
      t.string :purpose
      t.string :project_type

      t.timestamps
    end
  end
end
