require_relative 'lib/hangman.rb'

puts "Welcome have fun!"
game = Game.new
word_to_guess = get_word_from_file('dictionary.txt')

puts '_'*word_to_guess.length
correct_letters = []
tried_letters = []

while not game.finish?(word_to_guess, correct_letters) do
  print "Guess letter: "
  letter = gets.chomp.downcase
  system 'clear'

  if is_letter_in?(word_to_guess, letter)
    correct_letters << letter
  else
    tried_letters << letter
  end

  resp = ""
  word_to_guess.each_char { |char| correct_letters.include?(char) ? resp << char : resp << '_' }
  puts resp + "\nTried letters: " + tried_letters.join(", ")
end