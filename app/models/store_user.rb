class StoreUser < ApplicationRecord
  enum privilege: ['administrador', 'gerente', 'operacional', 'vendedor']

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { scope: :user_id }, email: true
end
