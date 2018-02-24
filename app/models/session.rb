class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :id, :user_id

  validates :email, email: true, presence: true
  validates :password, presence: true
  validate :authenticate

  private

  def authenticate
    user = User.find_by(email: @email) rescue nil
    user_store = StoreUser.where(status: true).find_by(email: @email) rescue nil

    if !user.nil?
      if user.password == @password
        @id = user.id
      else
        errors.add(:email, 'Email ou senha inválidos')
      end
    elsif !user_store.nil?
      if user_store.password == @password
        @id = user_store.user_id
        @user_id = user_store.id
      else
        errors.add(:email, 'Email ou senha inválidos')
      end
    else
      errors.add(:email, 'Email ou senha inválidos')
    end

  end

end
