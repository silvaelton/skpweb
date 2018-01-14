class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.integer :store_id
      t.string  :name
      t.text    :observation
      t.timestamps
    end
  end
end
