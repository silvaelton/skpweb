class User < ApplicationRecord
  has_many :stores

  validates :email, uniqueness: true
end
