class ManagerAvaliation < ApplicationRecord
  has_many :manager_avaliation_items
  belongs_to :avaliation_category
  belongs_to :operation

  before_save :set_items, on: :create

  validates :observation, :avaliation_category_id, presence: true

  def manager_avaliation_items_total
    '%.2f' % (self.manager_avaliation_items.sum(:score).to_f / self.manager_avaliation_items.count).to_f
  rescue
    0
  end

  def self.total_manager_avaliation
    total = 0
    self.all.each do |avaliation|
      total += avaliation.manager_avaliation_items_total.to_f
    end

    ('%.2f' % total)
  rescue
    0
  end

  private

  def set_items
    AvaliationItem.where(avaliation_category_id: self.avaliation_category_id,
                         operation_id: self.operation_id)
                  .order(id: :asc).each do |item|
      item = manager_avaliation_items.new(
        avaliation_item_id: item.id
      )

      item.save
    end
  end
end
