class Game
  attr_reader :words, :difficulty, :word_length, :word, :lives, :unknown_letter, :guesses, :current
  
  def initialize(difficulty)
    @difficulty = difficulty
    @word_length = difficulty * HANGMAN::DIFFICULTY_INCREMENT
    @words = []
    @lives = HANGMAN::LIVES
    @unknown_letter = HANGMAN::UNKNOWN_LETTER
    @guesses = []
    @current = '_'
  end
  
  def start
    build_word_list
    puts "We have #{words.count} different words to choose from...!"
    @word = pick_random_word
    puts unknown_letter * word.length
    while (lives>0 && current.include?('_')) do
      guesses.each { |guess| print 'You have tried:' " #{guess}," }
      puts 
      puts "Pick a letter:"
      letter = gets.chomp
      guesses << letter
      result = word.include?(letter)
      if result
        puts "That's right!"
      else
        puts " Miserable failure"
        @lives = lives - 1
      end
      @current = ''
      word.each_char do |letter|
        @current << (guesses.include?(letter) ? letter : '_')
      end
      
      case lives
      when 10
        ten_lives
      when 9
        nine_lives
      when 8
        eight_lives
      when 7
        seven_lives
      when 6
        six_lives
      when 5
        five_lives
      when 4
        four_lives
      when 3
        three_lives
      when 2
        two_lives
      when 1
        one_lives
        
      end    
      
      puts current
    end
    
    if current == word
      puts "You win!!!"
      return true
    else
      puts "You don't win!!!"
      return false
    end
  end
  
  def build_word_list
    all_words = []
    File.open('words.txt') do |f|
      while (line = f.gets) do
        all_words << line.chomp
      end
    end
    all_words.each do |word| 
      @words << word if word.length >= HANGMAN::SMALLEST_WORD_LENGTH && word.length <= word_length 
    end
  end
  
  def pick_random_word
    words[rand(words.length)]
  end
  
  def ten_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '############################################'
    puts
  end
  
  def nine_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                                            '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def eight_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                                            '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end

  def seven_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def six_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def five_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                      ()          |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def four_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                      ()          |||       '
    puts '                      =           |||       '
    puts '                      |           |||       '
    puts '                      |           |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def three_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                      ()          |||       '
    puts '                      =           |||       '
    puts '                     /|           |||       '
    puts '                    | |           |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def two_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                      ()          |||       '
    puts '                      =           |||       '
    puts '                     /|\          |||       '
    puts '                    | | |         |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end
  
  def one_lives
    puts
    puts '############################################'
    puts '                                            '
    puts '                      [|]=========[|]       '
    puts '                       |          |||       '
    puts '                       |          |||       '
    puts '                      ()          |||       '
    puts '                      =           |||       '
    puts '                     /|\          |||       '
    puts '                    | | |         |||       '
    puts '                     /            |||       '
    puts '                    |             |||       '
    puts '                                  |||       '
    puts '                [][][][][][][][][][][]      '
    puts '############################################'
    puts
  end

end  



