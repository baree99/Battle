require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    Game.create_game(params[:player1], params[:player2])
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    Game.instance.attack
    redirect '/winner' if Game.instance.player1.hp == 0 || Game.instance.player2.hp == 0
    erb :attack
   end

   get '/winner' do
     erb :winner
   end

  run! if app_file == $0
end
