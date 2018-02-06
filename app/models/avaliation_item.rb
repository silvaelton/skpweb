class AvaliationItem < ApplicationRecord
  belongs_to :avaliation_category

  validates :name, :avaliation_category_id, presence: true
end
