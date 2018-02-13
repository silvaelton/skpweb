class Manager < ApplicationRecord
  validates :name, presence: true
  validates :cpf, cpf: true, presence: true
end
