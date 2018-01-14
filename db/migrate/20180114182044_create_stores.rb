class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.string  :name
      t.string  :cnpj
      t.string  :telephone
      t.string  :city
      t.string  :state
      t.string  :cep
      t.string  :address
      t.string  :neigh
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
