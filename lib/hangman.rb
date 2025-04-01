require 'json'

class Game
  attr_accessor :remaining_turns

  def initialize()
    @remaining_turns = 10
  end

  def finish?()
    remaining_turns.eql?(0)
  end

  def save_game(word, correct_letters, tried_letters)
    json_file = JSON.pretty_generate ({
      word_to_guess: word,
      correct_letters: correct_letters,
      tried_letters: tried_letters,
      remaining_turns: remaining_turns
    })
    File.new("last_save.json", "w").write(json_file)
  end

  def load_game()
    json_file = JSON.load_file("last_save.json", {symbolize_names: true})
    remaining_turns = json_file[:remaining_turns]
  end
end

def get_word_from_file(filename)
  file = File.open(filename)
  dictionary = file.readlines(chomp: true)

  dictionary.sample
end