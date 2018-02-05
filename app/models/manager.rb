class Manager < ApplicationRecord
  validates :name, :cpf, presence: true
end
