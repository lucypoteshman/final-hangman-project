class Hangman
  
  attr_accessor :letters
  attr_reader :word
  
  def initialize(word)
    @word = word 
    @letters = []
    @num_of_guesses = 0
  end
  
  def print_progress
    character_array = @word.split("")
    final_array = []
    character_array.each do |character|
      if @letters.include?(character)
        final_array << character
      else
        final_array << "_"
      end
    end
    return final_array.join("")
  end
  
  def guess(letter)
    @letters << letter
    @num_of_guesses += 1
  end
  
end

