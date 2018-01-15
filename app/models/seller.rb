class Seller < ApplicationRecord
  has_many :sales

  def total_sale(operation_id)
    sales.where(operation_id: operation_id).sum(:value)
  end
end