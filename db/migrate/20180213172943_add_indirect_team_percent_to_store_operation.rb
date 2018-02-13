class AddIndirectTeamPercentToStoreOperation < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :indirect_team_percent, :float
    add_column :operations, :indirect_team_quantity, :integer
  end
end
