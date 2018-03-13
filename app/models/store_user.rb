class StoreUser < ApplicationRecord
  enum privilege: ['administrador', 'supervisor', 'nutricionista', 'gerente', 'vendedor']

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { scope: :user_id }, email: true
end


# administrador / dono
# full
#
# supervisor
# lojas
# periodos
# avaliacao gerente
#
# nutricionista
# lojas
# periodos
# avaliacao gerente
#
# gerente
# vendas
#
# vendedor
# relatorios de vendas
