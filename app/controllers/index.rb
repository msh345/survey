enable :sessions
######################GET###############

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/user/:id' do 
  @user = User.find(params[:id])
  erb :user
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
    redirect to '/'
  else
    @error_login = "username and password do not match"
    erb :login
  end

end

post '/signup' do
  user = User.create(params[:user])
  @error_signup = user.errors.full_messages

  if @error_signup.any?
    @error_signup = @error_signup.join(", ")
    erb :login
  else
    session[:user_id] = user.id
    redirect to '/'
  end

end