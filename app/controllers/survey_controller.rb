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
  @mc_questions = []
  @text_questions = []
  
  @survey.questions.each do |question|
    @mc_questions << question if question.question_type == "multichoice"
    @text_questions << question if question.question_type == "text"
  end

  # @survey_submissions = @survey.survey_submissions

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
  mc_questions = Hash[*params[:mc_question].flatten]

  questions.each do |question|
    survey.questions << Question.create(title: question, question_type: "text")
  end

  mc_questions.each do |question,answers|
    mc_answers = mc_questions["#{question}"][:answer]
    survey_questions = survey.questions << Question.create(title: question, question_type: "multichoice")
    last_question = survey_questions.last
    mc_answers.each do |answer|
      last_question.choices << Choice.create(title: answer)
    end
  end
  
  redirect "/user/profile"     # obtain session info for url or not?  
end 

post '/survey/submit' do
  @survey = Survey.find(params[:survey])
  @responses = params[:response]
  if current_user
    @survey_submission = SurveySubmission.create(survey_id: @survey.id, user_id: current_user.id)
  else
    @survey_submission = SurveySubmission.create(survey_id: @survey.id)
  end

  @responses.each do |question,response| #["100", "do"]
    q = Question.find(question)
    if q.question_type == "text"
      QuestionResponse.create(survey_submission_id: @survey_submission.id, question_id: question, answer: response)
    elsif q.question_type == "multichoice"
      QuestionResponse.create(survey_submission_id: @survey_submission.id, question_id: question, choice_id: response)
    end
  end 

  if current_user
    redirect '/user/profile'
  else
    redirect '/survey/take/success' 
  end 
end 