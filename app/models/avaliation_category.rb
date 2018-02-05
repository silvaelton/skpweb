class AvaliationCategory < ApplicationRecord
  validates :name, :minimum_score, presence: true
end
