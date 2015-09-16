get '/questions/:question_id/answers' do
  @answers = Answer.all
  erb :'/answers/index'
end

get '/questions/:question_id/answers/new' do
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  redirect '/questions/:question_id/answers'
end

get '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  erb :'/answers/show'
end

get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'/answers/edit'
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.update_attributes(params[:answer])
  redirect '/questions/:question_id/answers/#{@answer.id}'
end

delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/questions/:question_id'
end
