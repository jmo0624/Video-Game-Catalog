class UsersController < ApplicationController
  
  get '/login' do     #render login form
    redirect_if_logged_in
    erb :'users/login'
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email])   #find user
    
    if @user && @user.authenticate(params[:password])     #authenticate user
      session[:user_id] = @user_id
      #flash message?
      redirect "users/#{@user.id}"
    else
      flash[:errors] = "Email or password were invalid. Please try again or create an account."
      erb :'users/login'
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
      flash[:errors] = "Could not create account: #{@user.errors.full_message.to_sentence}"
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