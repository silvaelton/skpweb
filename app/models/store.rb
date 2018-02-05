class Store < ApplicationRecord
  has_many :sellers
  has_many :managers
  has_many :operations
  has_many :sales, through: :operations

  validates_presence_of :name, :telephone, :city, :state, :cep, :address
  validates :cnpj, presence: true

end
