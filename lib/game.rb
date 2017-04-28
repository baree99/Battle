class Game

  attr_reader :player1, :player2, :attacking_order

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @attacking_order = [@player1, @player2]
  end

  def self.create_game(player1, player2)
    @game = Game.new(player1,player2)
  end

  def self.instance
    @game
  end


  def attack
    turn_switcher[1].reduce_hp
  end
  
  def turn_switcher
    @attacking_order.reverse!
  end

end
