class User < ActiveRecord::Base
  include BCrypt
  has_many :questions, foreign_key: 'author_id'
  has_many :answers, foreign_key: 'commenter_id'

  validates :username, presence: :true, uniqueness: :true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
