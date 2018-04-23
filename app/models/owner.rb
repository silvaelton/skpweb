class Owner < ApplicationRecord
  validates :name, presence: true
  validates :cpf, cpf: true, presence: true
  
end
