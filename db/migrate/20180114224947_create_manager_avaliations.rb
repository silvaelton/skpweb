class CreateManagerAvaliations < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_avaliations do |t|
      t.integer :operation_id
      t.integer :avaliation_category_id
      t.text :observation

      t.timestamps
    end
  end
end
