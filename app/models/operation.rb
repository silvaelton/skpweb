class Operation < ApplicationRecord
  has_many :sales
  has_many :avaliation_categories
  has_many :avaliation_items
  has_many :manager_avaliations
  has_many :manager_objectives

  validates :name, :started_at, :ended_at, :value_start, :value_goal,
            :percent_start, :percent_goal, :percent_fixed_goal, presence: true

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

  # Funcoes do vendedor

  def total_sales
    sales.sum(:value)
  end

  def seller_prize_exceed_start_value(seller_id)
    (prize_exceed_start_value * percent_by_seller(seller_id)) / 100 rescue nil
  end

  def seller_prize_exceed_goal_value(seller_id)
    (prize_exceed_goal_value * percent_by_seller(seller_id)) / 100 rescue nil
  end

  def seller_fixed_goal(seller_id)
    if prize_exceed_goal_value.to_i > 0
      percent_fixed_goal rescue nil
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
    (self.percent_start * exceed_realized) / 100
  rescue
    'Sem informação'
  end

  # PREMIO POR EXCEDER A META
  def prize_exceed_goal_value
    (self.percent_goal.to_f * exceed_goal_realized.to_f) / 100
  rescue
    'Sem informação'
  end

  # EXCEDENTE AO PISO
  def exceed_realized
    (total_sales - self.value_start)
  rescue
    'Sem informação'
  end

  # EXCEDENTE A META
  def exceed_goal_realized
    (total_sales - self.value_goal)
  rescue
    'Sem informação'
  end
end
