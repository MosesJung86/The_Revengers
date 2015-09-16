class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :commenter, class_name: "User"
  has_many :votes, as: :votable
end
