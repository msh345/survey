#=======GET=========

get '/survey/create' do

  if current_user 
    erb :create_survey
  else 
    redirect '/'
  end 

end 

get '/survey/results/:hash' do
  if @survey = Survey.find_by_url(params[:hash])
    erb :survey_results 
  else  
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

