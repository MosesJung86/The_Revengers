#shows all answers
get '/questions/:question_id/answers' do
  @answers = Answer.all
  erb :'/answers/index'
end

#new answer form
get '/questions/:question_id/answers/new' do
  erb :'/answers/new'
end

#create new answer
post '/questions/:question_id/answers' do
  answer = Answer.new(params[:answer])
  if answer.save
    redirect '/questions/#{:question_id}/answers'
  else
    erb :'/answers/new'
  end
end

#show specific answer
get '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/show'
end

#answer edit form
get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/edit'
end

#edits attributes
put '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  @answer.update_attributes(params[:answer])
  redirect '/questions/#{:question_id}/answers/#{@answer.id}'
end

#deletes answer
delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  @answer.destroy
  redirect '/questions/#{:question_id}'
end
