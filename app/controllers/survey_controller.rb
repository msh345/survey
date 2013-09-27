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
  if @survey
    erb :survey_results 
  else 
    erb :survey_not_found
  end  
end 

get '/survey/take/:hash' do 
  @survey = Survey.find_by_url(params[:hash])
  if @survey
    erb :take_survey
  else 
    erb :survey_not_found
  end 
end 

get '/survey/take/success' do 
  erb :anonymous_success_page
end 


#=======POST ========

post '/survey/create' do
  #create instance to add to db
  @survey = Survey.new() #params
  if @survey.save 
    redirect '/user/:id'     # obtain session info for url or not? 
  else 
    # display red error message 
  end 
end 

post '/survey/submit' do
  #take answers and save to db 
  if current_user
    redirect '/user/:id'
  else 
    redirect '/survey/take/success' 
  end 
end 


