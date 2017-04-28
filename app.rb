require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

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
    @game.attack
    @attacker, @defender = @game.attacking_order
    redirect '/winner' if @attacker.hp == 0 || @defender.hp == 0
    erb :attack
   end

   get '/winner' do
     @winner = @game.attacking_order[0]
     erb :winner
   end

  run! if app_file == $0
end
