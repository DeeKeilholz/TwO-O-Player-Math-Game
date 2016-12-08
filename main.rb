require './models/question'
require './models/player'
require './models/game'
require 'pry'
require 'rainbow/ext/string'

# binding.pry

@game_on = true

puts
puts "-----".color(:red).blink + " THE GRAND OL' GAME OF MATH (math AKA The only place where people buy 64 watermelons and nobody knows why.) ".color(:red) + " -----".color(:red).blink
puts

# players choose their names"

def setup_player (new_player)
  #returns a player instance and prompts the user to enter name
  puts "#{new_player}, please enter your name:"
  name = gets.chomp
  new_player = Player.new(name)
  puts "Welcome, #{new_player.name}!"
  puts
  new_player
end

player1 = setup_player('Player1')
player2 = setup_player('Player2')

puts "-----".color(:red).blink + " READY? SET? GO! ".color(:red) + "-----".color(:red).blink
puts

# implementing game turns
game = Game.new.turn


# creates infinite game loop
while @game_on

  #asks a question
  question = Question.new

  #determine current player
  current_player = nil

  #implements alternating turns
  if game % 2 == 0
     current_player = player1
     print "#{player1.name}: ".color(:navyblue)
  else
    current_player = player2
    print "#{player2.name}: ".color(:darkgoldenrod)
  end

  # displays questions and prompts user for imput
  puts question.question_to_string
  user_answer = gets.chomp


  # player get points for right answers, loose a life for wrong answers
  if question.right_answer?(user_answer)
    puts "CORRECT! Way to go!"
    puts
    current_player.get_point
    game += 1

  elsif !question.right_answer?(user_answer)
    puts "POW! You lost a life."
    puts
    current_player.looses_life
    game += 1
  end

  puts "----- SCORE -----".color(:red)
  puts "#{player1.name}".color(:navyblue) + ", you have #{player1.right_answers} points, #{player1.lives} lives."
  puts "#{player2.name}".color(:darkgoldenrod) + ", you have #{player2.right_answers} points, #{player2.lives} lives."
  puts


  # ends while loop if player1 or player2 have 0 lives
  if player1.lives == 0 || player2.lives == 0

    if
      player1.lives == 0
      puts "#{player1.name}".color(:navyblue) + ", go buy some more watermelons."
      puts "The winner is" + " #{player2.name}.".color(:darkgoldenrod)
      puts
    elsif
      player2.lives == 0
        puts "#{player2.name}".color(:navyblue) + ", go buy some more watermelons."
      puts "The winner is" + " #{player1.name}.".color(:darkgoldenrod)
      puts
    end

    #puts final score
    puts  "-----".color(:red).blink + " FINAL SCORE ".color(:red) + "-----".color(:red).blink
    puts "#{player1.name}".color(:navyblue) + ", you have #{player1.right_answers} points, #{player1.lives} lives."
    puts "#{player2.name}".color(:darkgoldenrod) + ", you have #{player2.right_answers} points, #{player2.lives} lives."
    puts

    @game_on = false
  end


#end of infinite while loop
end
