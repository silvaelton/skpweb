class AddStoreTypeToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :store_type, :integer, default: 0
  end
end
