# Main Battle Page
get '/battles' do
  @hero = get_current_hero
  destroy_enemy
  session[:bossid] = nil
  @characters = Character.all
  erb :'/battles/home'
end

get '/battles/plains' do
  @hero = get_current_hero
  @enemyid = get_enemy
  @enemy = Character.find_by(id: @enemyid)
  session[:hp] = @hero.health
  session[:enemyhp] = @enemy.health
  erb :'/battles/plain'
end

get '/battles/dungeons' do
  @hero = get_current_hero
  @enemyid = get_strong_enemy
  @enemy = Character.find_by(id: @enemyid)
  session[:hp] = @hero.health
  session[:enemyhp] = @enemy.health
  erb :'/battles/dungeon'
end

get '/bosses/:id' do
  @hero = get_current_hero
  @enemy = Character.find_by(id: params[:id])
  session[:bossid] = @enemy.id
  session[:hp] = @hero.health
  session[:enemyhp] = @enemy.health
  erb :'/battles/boss'
end

# Attack button
get '/battles/attack' do
  @user = auth_current_user
  @hero = get_current_hero
  session[:type] = "attack"
  # redirect_to :back
  if (death == false)
    attack_total
    map_params
  else
    redirect '/users/profile'
  end
end

get '/battles/special1' do
  @user = auth_current_user
  @hero = get_current_hero
  session[:type] = "special1"
  # redirect_to :back
  if (death == false)
    special_attack_total
    map_params
  else
    redirect '/users/profile'
  end
end

get '/battles/special2' do
  @user = auth_current_user
  @hero = get_current_hero
  session[:type] = "special2"
  # redirect_to :back
  if (death == false)
    special2_attack_total
    map_params
  else
    redirect '/users/profile'
  end
end

get '/battles/heal' do
  @user = auth_current_user
  @hero = get_current_hero
  session[:type] = "heal"
  # redirect_to :back
  if (death == false)
    heal_total
    map_params
  else
    redirect '/users/profile'
  end
end