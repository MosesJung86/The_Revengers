enable :sessions

## Registration

post '/users' do
  @user = User.create(params)
  redirect "/users/#{@user.id}"
end

get '/users/new' do
  erb :'users/new'
end

## Login
get '/login' do
  erb :'users/login'
end

post '/login' do
  auth_logout
  @user = User.find_by(username: params[:username])
  p @user
  if @user == nil || @user.password != params[:password]
    @form_error = "Invalid email or password."
    erb :'users/login'
  else
    auth_login(@user)
    erb :'users/profile'
  end
end

## Logout

get '/logout' do
  auth_logout
  redirect '/login'
end


## Display one user

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/profile'
end


## Update/edit one user

get '/users/:id/edit' do
  @user = auth_current_user
 erb :'users/edit'
end

put '/users/:id' do
  auth_current_user
  p '*'*50
  p @current_user
  @current_user.update(username:params[:username], password:params[:password])
  redirect "/users/#{@current_user.id}"
end


## Delete one user

delete '/users/:id' do
end