class User < ApplicationRecord
  has_many :stores
  has_many :store_users

  validates :email, uniqueness: true

  enum privilege: ['administrador']
end
