class AddManagerPrizePointToOperation < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :manager_prize_point, :float
  end
end
