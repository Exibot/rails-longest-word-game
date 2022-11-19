require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.shuffle[0,9]
    #@start_time = Time.now
  end

  def score
    @parametros = params
    @attempt = params[:attempt]
    #@size = params[:attempt].size
    @result = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@attempt}").read)
    if @result["found"]
      @acierto = true
      #@endtime = Time.now
      #@time = @endtime - start_time
      #puts (@size / @time)
    else
      @acierto = false
    end
  end
end
