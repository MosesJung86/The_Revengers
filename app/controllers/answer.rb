get '/questions/:question_id/answers' do
  @answers = Answer.all
  erb :'/answers/index'
end

get '/questions/:question_id/answers/new' do
  @question_id = params[:question_id]
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  answer = Answer.new(params[:answer])
  @question_id = params[:question_id]
  if answer.save
    redirect "/questions/#{@question_id}"
  else
    erb :'/answers/new'
  end
end

get '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/show'
end

get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/edit'
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  @answer.update_attributes(params[:answer])
  redirect '/questions/#{:question_id}/answers/#{@answer.id}'
end

delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  @answer.destroy
  redirect '/questions/#{:question_id}'
end
