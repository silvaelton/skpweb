class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :id

  validates :email, email: true, presence: true
  validates :password, presence: true
  validate :authenticate

  private

  def authenticate
    user = User.find_by(email: @email) rescue nil

    if !user.nil? && user.password == @password
      @id = user.id
    else
      errors.add(:email, 'Email ou senha inválidos')
    end
  end

end
