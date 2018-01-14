class Operation < ApplicationRecord
  has_many :sales
  has_many :avaliation_categories
  has_many :avaliation_items
  has_many :manager_avaliations

  validates :name, :started_at, :ended_at, :value_start, :value_goal,
            :percent_start, :percent_goal, :percent_fixed_goal, presence: true
end
