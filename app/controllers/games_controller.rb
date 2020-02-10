require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @new_word = params[:letter].chars
    @grid = params[:letters].chars
    @new_word.zip(@grid.sort)
    raise
    url = "https://wagon-dictionary.herokuapp.com/#{@new_word}"
    word_serialized = open(url).read
    @word = JSON.parse(word_serialized)
  end
end
