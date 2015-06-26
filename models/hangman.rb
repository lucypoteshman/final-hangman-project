class Hangman
  
  attr_accessor :letters, :word
  
  def initialize
    @word = "" 
    @letters = []
    @wrong_guesses = 0
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
    return final_array.join(" ")
  end
  
  def guess(letter)
    @letters << letter
    if @word.include?(letter)
       @wrong_guesses += 0
      return "Correct guess!"
    else 
      @wrong_guesses += 1
      return 'Wrong guess. <img src = "http://free.clipartof.com/85-Free-3D-Stressed-Smiley-Face-Clipart-Illustration.png"height=200 />'
    end
  end
  
  def game_over
    if @wrong_guesses > 6
      return "Game Over."
    else
      return "Try Again."
    end
  end
  
  def result
    print_progress.gsub(" ", "")
  end
  

  
  def check
    if result == @word
     return "You win!" 
    else
      return "Guess Another Letter"
    end
  end
end

