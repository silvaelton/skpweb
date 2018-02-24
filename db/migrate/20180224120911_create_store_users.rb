class CreateStoreUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :store_users do |t|
      t.integer :user_id
      t.string  :name
      t.string  :email
      t.string  :password
      t.boolean :status, default: true
      t.integer :privilege, default: 0
      t.timestamps
    end
  end
end
