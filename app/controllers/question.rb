#shows all questions
get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

#new question form
get '/questions/new' do
  erb :'/questions/new'
end

#create new question
post '/questions' do
  question = Question.new(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    erb :'/questions/new'
  end
end

#show specific question
get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  erb :'/questions/show'
end

#edit form
get '/questions/:question_id/edit' do
  @question = Question.find_by(id: params[:question_id])
  erb :'/questions/edit'
end

#edits attributes
put '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  @question.update_attributes(params[:question])
  redirect "/questions/#{@question.id}"
end

#deletes question
delete 'questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  @question.destroy
  redirect '/'
end
