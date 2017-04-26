
class Game

  attr_reader :player1, :player2, :turn, :not_in_turn

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @turn = @player2
    @not_in_turn = @player1
  end

  def turn_switcher
    @turn = @not_in_turn
    @not_in_turn =  (@not_in_turn == @player2 ?  @player1 : @player2)
  end

  def self.attack
    @not_in_turn.reduce_hp
  end

end
