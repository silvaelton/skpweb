class ManagerAvaliationItem < ApplicationRecord
  belongs_to :avaliation_item

  def score
    '%.2f' % self[:score].to_f
  rescue
    0
  end
end
