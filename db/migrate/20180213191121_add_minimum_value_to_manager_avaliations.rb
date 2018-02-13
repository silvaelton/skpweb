class AddMinimumValueToManagerAvaliations < ActiveRecord::Migration[5.1]
  def change
    add_column :manager_avaliations, :minimum_value, :float
  end
end
