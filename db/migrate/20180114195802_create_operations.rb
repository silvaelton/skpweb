class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.integer :store_id
      t.string  :name
      t.text    :observation
      t.date    :started_at
      t.date    :ended_at
      t.float   :value_start
      t.float   :value_goal
      t.float   :percent_start
      t.float   :percent_goal
      t.float   :percent_fixed_goal
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
