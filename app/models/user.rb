class User < ActiveRecord::Base
  has_many :questions, foreign_key: 'author_id'
  has_many :answers, foreign_key: 'commenter_id'
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
