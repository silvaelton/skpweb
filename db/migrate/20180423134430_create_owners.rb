class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.integer :store_id
      t.string  :name
      t.string  :email
      t.string  :telephone
      t.string  :cpf
      
      t.timestamps
    end
  end
end
