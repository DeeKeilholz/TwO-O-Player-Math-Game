class Player

  attr_accessor :name, :lives, :right_answers

# player HAS name, lives, answers
  def initialize(name)
    @name = name
    @lives = 3
    @right_answers = 0
  end

  # player gets point for right answers
  def get_point
    @right_answers += 1
  end

  # player looses life for wrong answers
  def looses_life
    @lives -= 1
  end

end
