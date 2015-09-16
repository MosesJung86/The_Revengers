class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  include BCrypt

  validates :username, presence: :true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
