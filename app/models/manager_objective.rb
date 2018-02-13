class ManagerObjective < ApplicationRecord
  validates :name, :base_value, presence: true


  def base_value
    '%.2f' % self[:base_value].to_f
  end

  def self.total_value
    '%.2f' % where(verified: true).sum(:base_value).to_f
  rescue
    nil
  end
end
