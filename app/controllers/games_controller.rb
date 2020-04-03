class GamesController < ApplicationController
  
  #render form to create new entry.....'games/new'
  get '/games/new' do
    erb :'games/new'
  end
  #post games to create new game entry
  post '/games' do
    
    #if !logged_in?
     # redirect "/"
   # end
    
    if params[:title] != ""
      #create new entry
      @game = Game.create(title: params[:title], user_id: current_user.id)
      redirect "/games/#{@game.id}"
    else
      redirect "games/new"
    end
      
  end
  
  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :'/games/show'
  end
  #index for all games
  
end
