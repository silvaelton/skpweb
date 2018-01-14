class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string  :operation_id
      t.string  :integer
      t.integer :seller_id
      t.float   :value

      t.timestamps
    end
  end
end
