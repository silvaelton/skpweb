class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string  :name
      t.string  :cnpj
      
      t.timestamps
    end
  end
end
