class CreateManagerObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_objectives do |t|
      t.string :name
      t.integer :operation_id
      t.float :base_value
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
