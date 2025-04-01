require_relative 'lib/hangman.rb'

puts "Welcome have fun!"
game = Game.new

word_to_guess = ""
correct_letters = []
tried_letters = []

if File.exist?("last_save.json")
  puts "There is a saved game do you want to continue or restart?"
  if gets.chomp.downcase.eql?("y")
    loaded_data = game.load_game
    word_to_guess, correct_letters, tried_letters = loaded_data[:word_to_guess], loaded_data[:correct_letters], loaded_data[:tried_letters]
    state = ""
    word_to_guess.each_char { |char| correct_letters.include?(char) ? state << char : state << '_' }
    puts state
  end
else
  word_to_guess = get_word_from_file('dictionary.txt')
  puts '_'*word_to_guess.length
end

while !game.finish?() do
  print "Guess letter: "
  letter = gets.chomp.downcase
  system 'clear'

  if word_to_guess.include?(letter)
    correct_letters << letter
  else
    tried_letters << letter
  end

  state = ""
  word_to_guess.each_char { |char| correct_letters.include?(char) ? state << char : state << '_' }
  game.remaining_turns = game.remaining_turns - 1
  puts state + "\nTried letters: " + tried_letters.join(", ") + "\n#{game.remaining_turns} turns left"
  
  puts "Save? Y or N"
  resp = gets.chomp.downcase

  if resp.eql?("y")
    game.save_game(word_to_guess, correct_letters, tried_letters)
    break
  end
end