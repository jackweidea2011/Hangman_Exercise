$:.unshift('.')

module HANGMAN
  SMALLEST_WORD_LENGTH = 4
  DEFAULT_DIFFICULTY = 2
  DIFFICULTY_INCREMENT = 4
  LIVES = 10
  UNKNOWN_LETTER = "_"
end

require 'game'

puts
puts '############################################'
puts '                ---HANGMAN---               '
puts "  (Don't kill me!)    [|]=========[|]       "
puts '                o      |          |||       '
puts '                   o   |          |||       '
puts '                     ()           |||       '
puts '                     =            |||       '
puts '                    /|\           |||       '
puts '                   | | |          |||       '
puts '                    / \           |||       '
puts '                   |   |          |||       '
puts '                                  |||       '
puts '                [][][][][][][][][][][]      '
puts '############################################'
puts

puts "Pick a difficulty level! (1-6)"
difficulty = gets.to_i
difficulty = HANGMAN::DEFAULT_DIFFICULTY if difficulty < 1 or difficulty >6


game = Game.new(difficulty)
win = game.start
if win
  puts
  puts '############################################'
  puts '                                            '
  puts '                      [|]=========[|]       '
  puts '                       |          |||       '
  puts "  I'm alive!           |          |||       "
  puts '                       O          |||       '
  puts '                                  |||       '
  puts '    \    /                        |||       '
  puts '     \()/                         |||       '
  puts '      |                           |||       '
  puts '      |                           |||       '
  puts '     / \                          |||       '
  puts '    |   |       [][][][][][][][][][][]      '
  puts '############################################'
  puts
  
else
  
  puts
  puts '############################################'
  puts '                                            '
  puts '    (You Lost!)       [|]=========[|]       '
  puts '                       |          |||       '
  puts '                       |          |||       '
  puts '                      ()          |||       '
  puts '                      =           |||       '
  puts '                     /|\          |||       '
  puts '                    | | |         |||       '
  puts '                     / \          |||       '
  puts '                    |   |         |||       '
  puts '                                  |||       '
  puts '                [][][][][][][][][][][]      '
  puts '############################################'
  puts

end
