class Manager < ApplicationRecord
  validates :name, :cpf, :code, presence: true
end
