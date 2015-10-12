class Character < ActiveRecord::Base
  has_many :user_characters
  has_many :users, through: :user_characters

  def self.swap_hero(old_hero, new_hero)
    # unset the old hero
    self.find(old_hero).current_hero = false

    # set the new hero and return their id
    nh = self.find(new_hero)
    nh.current_hero = true
    nh.id
  end

end
