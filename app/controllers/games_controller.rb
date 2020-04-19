class GamesController < ApplicationController
  
  #render form to create new entry.....'games/new'
  get '/games/new' do
    redirect_if_not_logged_in
    erb :'games/new'
  end
 
  #post games to create new game entry
  post '/games' do
    redirect_if_not_logged_in
    
    if params[:title] != ""
      #create new entry
     
      @game = Game.create(title: params[:title], user_id: current_user.id, genre: params[:genre], system: params[:system], dev_company: params[:dev_company], release_year: params[:release_year])
      #flash message?
      redirect "/games/#{@game.id}"
    else
      flash[:errors] = "Invalid entry, please try again."
      redirect "games/new"
    end
      
  end
  
  get '/games/:id' do
    set_game_entry
    erb :'/games/show'
  end
  #index for all games
  
  get '/games' do
    
    @games = Game.all
    erb :'games/index'
    
  end
  
  get '/games/:id/edit' do

  	redirect_if_not_logged_in
  	set_game_entry
  	if authorized_to_edit?(@game)
  		erb :'/games/edit'
  	else
  		redirect "users/#{current_user.id}"
  	end
  	
  end

  patch '/games/:id' do            #edit game

  	redirect_if_not_logged_in
  	set_game_entry

  	if @game.user == current_user && params[:title] != ""
  		@game.update(title: params[:title])
  		redirect "/games/#{@game.id}"
  	else
  		redirect "users/#{current_user.id}"
  	end

  end

  delete '/games/:id' do    #delete game
  	set_game_entry
  	if authorized_to_edit?(@game)
  		@game.destroy
  		flash[:message] = "Successfully removed that game from the catalog."
  		redirect '/games'
  	else
  		redirect '/games'
  	end
  end
  
  def set_game_entry
    
    @game = Game.find(params[:id])
    
  end
  
  
  
end
