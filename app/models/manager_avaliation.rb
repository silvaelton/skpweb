class ManagerAvaliation < ApplicationRecord
  has_many :manager_avaliation_items
  belongs_to :avaliation_category

  before_save :set_items

  validates :observation, :avaliation_category_id, presence: true

  def manager_avaliation_items_total
    manager_avaliation_items.sum(:score) / manager_avaliation_items.count
  end

  private

  def set_items
    AvaliationItem.all.order(:name).each do |item|
      item = manager_avaliation_items.new(
        avaliation_item_id: item.id
      )

      item.save
    end
  end
end
