class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.integer :store_id
      t.string  :name
      t.string  :cpf
      t.string  :code
      t.string  :telephone

      t.timestamps
    end
  end
end
