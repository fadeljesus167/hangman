class Game
  def finish?(word, correct_letters)
    word.chars.each do |char|
      if !correct_letters.include?(char)
        return false
      end
    end
    puts "You won!"
    true
  end
end

def get_word_from_file(filename)
  file = File.open(filename)
  dictionary = file.readlines(chomp: true)

  dictionary.sample
end

def is_letter_in?(word, letter)
  word.include?(letter) ? true : false
end