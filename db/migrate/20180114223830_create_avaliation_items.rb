class CreateAvaliationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliation_items do |t|
      t.integer :operation_id
      t.integer :avaliation_category_id
      t.string :name

      t.timestamps
    end
  end
end
