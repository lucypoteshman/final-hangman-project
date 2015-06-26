require 'bundler'
Bundler.require
require './models/hangman.rb' 

class MyApp < Sinatra::Base
  
  @@hangman = Hangman.new
  
  get '/' do
    erb :index
  end
  
  post '/input' do
    # {"word" => "ribbon"}
    input = params["word"]
    @@hangman.word = input
    @@hangman.letters = []
    @progress = @@hangman.print_progress
    erb :enter_letter
  end
  
  post '/guess' do
    # {"word" => "ribbon"}
    letter = params["letter"]
    @guess_result = @@hangman.guess(letter)
    @progress = @@hangman.print_progress
    @status = @@hangman.check
    @game_over = @@hangman.game_over
    erb :enter_letter
  end

end