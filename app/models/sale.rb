class Sale < ApplicationRecord
  belongs_to :operation
  belongs_to :seller

  validates :seller_id, :value, presence: true


  def value
    '%.2f' % self[:value].to_f
  end
end
