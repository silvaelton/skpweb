class Store < ApplicationRecord
  has_many :sellers
  has_many :managers
  has_many :operations
end
