#=======GET=========

get '/survey/create' do
  if current_user 
    erb :create_survey
  else 
    redirect '/'
  end 
end 

get '/survey/results/:hash' do
  @survey = Survey.find_by_url(params[:hash])
  @questions = @survey.questions
  @survey_submissions = @survey.survey_submissions
  if @survey
    erb :survey_results 
  else 
    erb :survey_not_found
  end  
end 

get '/survey/take/success' do 
  erb :anonymous_success_page
end 

get '/survey/take/:hash' do 
  @survey = Survey.find_by_url(params[:hash])
  if @survey
    erb :take_survey
  else 
    erb :survey_not_found
  end 
end 



#=======POST ========

post '/survey/create' do
  puts params
  # random_string = (0...8).map { (65 + rand(26)).chr }.join

  # surveys = current_user.surveys << Survey.create(title: params[:survey_title], url: random_string)
  # survey = Survey.last
  # questions = params[:question]
  # questions.each do |question|
  #   survey.questions << Question.create(title: question)
  # end
  
  redirect "/user/profile"     # obtain session info for url or not?  
end 

post '/survey/submit' do
  #take answers and save to db 
  p params
  @survey_id = params[:survey]
  @response = params[:response]
  @survey_submission = SurveySubmission.create(survey_id: @survey_id, user_id: current_user.id)

  @response.each do |response| #["100", "do"]
    QuestionResponse.create(survey_submission_id: @survey_submission.id, question_id: response[0], answer: response[1])
  end 

  if current_user
    redirect '/user/profile'
  else 
    redirect '/survey/take/success' 
  end 
end 


