# #shows all heroes
# get '/heroes' do
#   @heroes = Character.all
#   erb :'/index'
# end

# #new hero form
# get '/heroes/new' do
#   erb :'/heroes/new'
# end

# #create new hero
# post '/heroes' do
#   hero = Hero.new(params[:hero])
#   if hero.save
#     redirect '/'
#   else
#     erb :'/heroes/new'
#   end
# end

#show specific hero
get '/heroes/:character_id' do
  @user = auth_current_user
  new_hero = params[:character_id].to_i
  swap_hero(new_hero)
  # if request.xhr?
  #   erb :'/battles/plain'
  # else
  redirect "/users/#{@user.id}"
  # end
end

#edit form
# get '/heroes/:hero_id/edit' do
#   @hero = Hero.find_by(id: params[:hero_id])
#   erb :'/heroes/edit'
# end

#edits attributes
# put '/heroes/:hero_id' do
#   @hero = Hero.find_by(id: params[:hero_id])
#   @hero.update_attributes(params[:hero])
#   redirect "/heroes/#{@hero.id}"
# end

#deletes hero
# delete '/heroes/:hero_id' do
#   @hero = hero.find_by(id: params[:hero_id])
#   @hero.destroy
#   redirect '/heroes'
# end
