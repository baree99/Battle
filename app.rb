require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(params[:player1], params[:player2])
    # $player1 = Player.new(params[:player1])
    # $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    redirect '/loser' if $game.player1.hp == 0 || $game.player2.hp == 0
    $game.attack
     erb :attack
   end

   get '/loser' do
     erb :loser
   end

  run! if app_file == $0
end
