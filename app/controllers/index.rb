get '/' do
  @characters = Character.all
  erb :index
end
