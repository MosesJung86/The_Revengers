helpers do
  def get_hero
    session[:hero] ||= 2
  end

  def get_hero_avatar
    Character.find(get_hero).picture_id
  end

  def get_current_hero
    Character.find(get_hero)
  end

  def swap_hero(with_hero)
    old_hero = session[:hero] || get_hero
    session[:hero] = Character.swap_hero(old_hero, with_hero)
  end
end