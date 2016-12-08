class Game
  attr_accessor :turn

# game HAS turns
  def initialize
    @turn = 0
  end

  def each_turn
    @turn += 1
  end

end

# new_turn = Game.new.turn
