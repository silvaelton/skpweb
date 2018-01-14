class CreateManagerAvaliationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_avaliation_items do |t|
      t.integer :manager_avaliation_id
      t.integer :avaliation_item_id
      t.float :score

      t.timestamps
    end
  end
end
