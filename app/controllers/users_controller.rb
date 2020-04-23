class UsersController < ApplicationController
  
  get '/login' do     #render login form
    redirect_if_logged_in
    erb :'users/login'
  end
  
  post '/login' do
    
    @user = User.find_by(email: params[:email])   #find the user

    if @user && @user.authenticate(params[:password])   #authenticate
     
      session[:user_id] = @user.id      # actually logging the user in and creating session
     

      flash[:message] = "Welcome, #{@user.name}!"
      redirect "users/#{@user.id}"  #redirect to user show page
    else
      flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
     
      redirect '/login'   #redirect to login page
    end
  end
  
  get '/signup' do      #render signup form
    redirect_if_logged_in
    erb :'users/signup'
  end
  
  post '/users' do
    
    @user = User.new(params)
      
    if @user.save  
      session[:user_id] = @user.id   #log user in
      #flash message?
      redirect "users/#{@user.id}"
    else
     
      redirect "users/signup"
    end
    
  end
  
  get '/users/:id' do          #show route
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :"/users/show"
    
  end
  
  get '/logout' do
    session.clear
    redirect "/"
  end
  
end