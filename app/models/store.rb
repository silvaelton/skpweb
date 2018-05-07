class Store < ApplicationRecord
  has_many :sellers
  has_many :managers
  has_many :supervisors
  has_many :owners
  has_many :operations
  has_many :sales, through: :operations

  validates_presence_of :name, :telephone, :city, :state, :cep, :address
  validates :cnpj, cnpj: true, presence: true

  enum store_type: ['delivery','loja','loja_e_delivery']
end
