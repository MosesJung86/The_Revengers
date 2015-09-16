class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :description, presence: true
end
