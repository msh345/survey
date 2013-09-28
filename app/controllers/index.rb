enable :sessions
######################GET###############

get '/' do
  if current_user
    redirect '/user/profile'
  else
    erb :index
  end
end

get '/user/profile' do 
  @user = current_user
  if @user
    erb :profile
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end



######################POST###############


post '/login' do
  user = User.authenticate(params[:user])

  if user
    session[:user_id] = user.id
    redirect to '/user/profile'
  else
    @error_login = "username or password incorrect"
    erb :index 
  end
end

post '/signup' do
  user = User.create(params[:user])
  @error_signup = user.errors.full_messages

  if @error_signup.any?
    @error_signup = @error_signup.join(", ")
    erb :index
  else
    session[:user_id] = user.id
    redirect to '/user/profile'
  end

end