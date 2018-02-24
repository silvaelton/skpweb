class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.text   :bio
      t.string :avatar
      t.boolean :status, default: true
      t.integer :privilege, default: 0
      t.timestamps
    end
  end
end
