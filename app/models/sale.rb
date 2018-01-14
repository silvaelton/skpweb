class Sale < ApplicationRecord
  belongs_to :operation
  belongs_to :seller
end
