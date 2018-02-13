class Operation < ApplicationRecord
  has_many :sales
  has_many :avaliation_categories
  has_many :avaliation_items
  has_many :manager_avaliations
  has_many :manager_avaliation_items, through: :manager_avaliations
  has_many :manager_objectives

  belongs_to :store

  validates :name, :started_at, :ended_at, :value_start, :value_goal,
            :percent_start, :percent_goal, :percent_fixed_goal,
            :indirect_team_quantity, :indirect_team_percent, presence: true

  # Correcao de campos
  def value_start
    '%.2f' % self[:value_start].to_f
  end

  def value_goal
    '%.2f' % self[:value_goal].to_f
  end

  def percent_start
    '%.2f' % self[:percent_start].to_f
  end

  def percent_goal
    '%.2f' % self[:percent_goal].to_f
  end

  def percent_fixed_goal
    '%.2f' % self[:percent_fixed_goal].to_f
  end


  def total_super
    total_seller = 0
    sellers = self.sales.select(:seller_id).group(:seller_id)
    self.store.sellers.where(id: sellers).each do |seller|
      total_seller += self.total_seller_prize(seller.id)
    end

    (total_seller.to_f + manager_total_point_super.to_f + total_indirect_team.to_f)
  rescue
    0
  end

  # Funcoes equipe indireta

  def total_indirect_team
    total_seller = 0
    sellers = self.sales.select(:seller_id).group(:seller_id)
    self.store.sellers.where(id: sellers).each do |seller|
      total_seller += self.total_seller_prize(seller.id).to_f
    end

    total_seller
    (self.indirect_team_percent * (total_seller.to_f + manager_total_point_super.to_f) / 100)
  rescue
    0
  end

  def percent_indirect_team
    total_seller = 0
    sellers = self.sales.select(:seller_id).group(:seller_id)
    self.store.sellers.where(id: sellers).each do |seller|
      total_seller += self.total_seller_prize(seller.id)
    end

    '%.2f' % (total_indirect_team.to_f / indirect_team_quantity.to_f)
  rescue
    0
  end

  # Funcoes do gerente

  def manager_total_point_super
    (manager_prize_point.to_f * manager_prize_total.to_f)
  rescue
    0
  end


  def manager_total_point
    avaliation = self.manager_avaliations.total_manager_avaliation
    objective  = self.manager_objectives.total_value

    (avaliation.to_f + objective.to_f)
  rescue
    0
  end

  def manager_prize_total
    (manager_total_point.to_f - manager_minimum_point.to_f).to_f
  rescue
    0
  end

  def manager_minimum_point
    '%.2f' % self.manager_avaliations.sum(:minimum_value).to_f

  end

  # Funcoes do vendedor

  def total_sales
    sales.sum(:value)
  end

  def seller_prize_exceed_start_value(seller_id)
    value = ((prize_exceed_start_value * percent_by_seller(seller_id)) / 100).to_f
    value > 0 ? value : 0
  rescue
    nil
  end

  def seller_prize_exceed_goal_value(seller_id)
    value = (prize_exceed_goal_value * percent_by_seller(seller_id)) / 100
    value > 0 ? value : 0
  rescue
    nil
  end

  def seller_fixed_goal(seller_id)
    if prize_exceed_goal_value.to_f > 0
      percent_fixed_goal.to_f rescue nil
    else
      0
    end
  end

  def total_seller_prize(seller_id)
    seller_prize_exceed_start_value(seller_id) +
    seller_prize_exceed_goal_value(seller_id) +
    seller_fixed_goal(seller_id)
  rescue
    'Sem informação'
  end

  # => CALCULOS
  # PORCENTAGEM DO PREMIO DO VENDEDOR
  def percent_by_seller(seller_id)
    seller = Seller.find(seller_id)
    total_sale = sales.sum(:value)
    total_by_seller = sales.where(seller_id: seller.id).sum(:value)

    ((total_by_seller / total_sale) * 100).round(2)
  rescue
    'Sem informação'
  end

  # PREMIO POR EXCEDER AO PISO
  def prize_exceed_start_value
    value = ((self.percent_start.to_f * exceed_realized) / 100).to_f
    value > 0 ? value : 0
  rescue
    'Sem informação'
  end

  # PREMIO POR EXCEDER A META
  def prize_exceed_goal_value
    value = ((self.percent_goal.to_f * exceed_goal_realized.to_f) / 100).to_f
    value > 0 ? value : 0
  rescue
    'Sem informação'
  end

  # EXCEDENTE AO PISO
  def exceed_realized
    value = (total_sales - self.value_start.to_f)
    value > 0 ? value : 0
  rescue
    'Sem informação'
  end

  # EXCEDENTE A META
  def exceed_goal_realized
    value = (total_sales - self.value_goal.to_f)
    value > 0 ? value : 0
  rescue
    'Sem informação'
  end
end
