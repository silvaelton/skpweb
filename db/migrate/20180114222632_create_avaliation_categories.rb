class CreateAvaliationCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliation_categories do |t|
      t.integer :operation_id
      t.string :name
      t.float :minimum_score

      t.timestamps
    end
  end
end
