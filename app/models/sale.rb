class Sale < ApplicationRecord
  belongs_to :operation
  belongs_to :seller

  validates :seller, :value, presence: true
end
