class CreateElectFrameworks < ActiveRecord::Migration
  def change
    create_table :elect_frameworks do |t|
      t.references :project, index: true
      t.string :framework_type
      t.string :name
      t.timestamps
    end
  end
end
