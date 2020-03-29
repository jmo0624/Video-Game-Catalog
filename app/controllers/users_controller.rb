class UsersController < ApplicationController
  
  get '/login' do
    erb :'users/login'
  end
  
  post '/login' do
    @user = User.find_by(email: params[:email])
    
    if @user.authenticate(params[:password])
      session[:user_id] = @user_id
      redirect "users/#{@user.id}"
    else
      erb :login
    end
  end
  
end