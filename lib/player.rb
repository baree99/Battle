class Player

  attr_reader :name, :hp
  HP_DEFAULT = 100
  def initialize(name, hp = HP_DEFAULT)
    @name = name
    @hp = hp
  end

  def reduce_hp
    @hp -= 10
  end
end
