require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]
    response = URI.parse("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    english_word = json['found']
    include = params[:word].upcase.chars.all? { |letter| params[:word].count(letter) <= @letters.count(letter) }
    if include
      if english_word
        @result = "Congratulations, #{params[:word]} is a valid english word!"
      else
        @result = "Sorry but #{params[:word]} is not an english word"
      end
    else
      @results = "Sorry but #{params[:word]} can't be built out of #{@letters}"
    end
  end
end
