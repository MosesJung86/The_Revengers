class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :description, presence: true
end
