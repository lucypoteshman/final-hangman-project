require 'bundler'
Bundler.require
require 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/input' do
    # {"word" => "ribbon"}
    input = params["word"]
    @hangman = Hangman.new(input)
    erb :enter_letter
  end
  
  post '/guess' do
    # {"word" => "ribbon"}
    letter = params["letter"]
    @hangman.guess(letter)
    @progress = @hangman.print_progress
    erb :enter_letter
  end

end