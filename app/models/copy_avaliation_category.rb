class CopyAvaliationCategory
  include ActiveModel::Model

  attr_accessor :operation_id, :target_id

  validates :target_id, presence: true
  validate  :target_valid?

  def copy_and_paste
    @operation_target = Operation.find(self.target_id)
    @operation = Operation.find(self.operation_id)

    @operation_target.avaliation_categories.each do |category|
      @item = @operation.avaliation_categories.new({
        name: category.name,
        minimum_score: category.minimum_score
      })

      @item.save
    end
  end

  private

  def target_valid?
    @operation = Operation.find(self.operation_id)
    if @operation.avaliation_categories.present?
      errors.add(:target_id, 'Não é possível realizar cópia, já existe categorias cadastradas')
    end
  end
end
