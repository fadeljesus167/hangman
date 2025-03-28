require_relative 'lib/hangman.rb'

puts "Welcome have fun!"
word_to_guess = get_word_from_file('dictionary.txt')

puts '_'*word_to_guess.length