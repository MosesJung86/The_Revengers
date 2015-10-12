class User < ActiveRecord::Base
  include BCrypt
  has_many :user_characters
  has_many :characters, through: :user_characters

  validates :username, presence: :true, uniqueness: :true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
