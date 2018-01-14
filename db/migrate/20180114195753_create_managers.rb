class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.integer :store_id
      t.string :name
      t.string :cpf
      t.string :observation
      t.string :telephon
      t.timestamps
    end
  end
end
