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
  random_string = (0...8).map { (65 + rand(26)).chr }.join

  surveys = current_user.surveys << Survey.create(title: params[:survey_title], url: random_string)
  survey = Survey.last
  questions = params[:question]
  questions.each do |question|
    survey.questions << Question.create(title: question)
  end
  
  redirect "/user/profile"     # obtain session info for url or not?  
end 

post '/survey/submit' do
  #take answers and save to db 
  @survey_id = params[:survey]
  @response = params[:response]
  @survey_submission = SurveySubmission.create(survey_id: @survey_id, user_id: current_user.id)
  p "the survey submission id we created was #{@survey_submission.id}"

  # @response.each do |response| #["100", "do"]
  #   puts "response: #{response.inspect}"
  #   if Question.find(response[0]).question_type == "text area"
  #     QuestionResponse.create(survey_submission_id: @survey_submission.id, question_id: response[0], answer: response[1])
  #     # p QuestionResponse
  #   elsif Question.find(response[0]).question_type == "multiple choice"
  #     QuestionResponse.create(survey_submission_id: @survey_submission.id, question_id: response[0], choice_id: response[1])
  #   end 
  # end 

  @response.each do |response| #["100", "do"]
    @survey_submission.question_responses << QuestionResponse.new
    # resp = QuestionResponse.create(survey_submission_id: @survey_submission.id)
    resp.question = Question.find(question_id: response[0])
    if resp.question.question_type == "text area"
      resp.answer = response[1]
      # p QuestionResponse
    elsif resp.question.question_type == "multiple choice"
      resp.choice = choice.find(response[1])
    end 
    resp.save
  end 

  if current_user
    redirect '/user/profile'
  else 
    redirect '/survey/take/success' 
  end 
end 


