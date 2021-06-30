require 'net/http'

class MoviesController < ApplicationController
  def results
    if params[:movie] != nil
      $title = params[:movie][:title]
      $year = params[:movie][:year]
    end
    omdb = "http://www.omdbapi.com/?apikey=e4c4b604&plot=full"
    url = URI.parse(omdb + '&s=' + $title + '&y=' + $year)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @response = ActiveSupport::JSON.decode(res.body)
    if @response["Response"] == "True"
      @movies = @response["Search"]
      render :results
    else
      redirect_to "/movies/seeker"
    end
  end
  
  def find_by_id
    id = params[:id]
    omdb = "http://www.omdbapi.com/?apikey=e4c4b604&plot=full"
    url = URI.parse(omdb +'&i=' + id)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @movie = ActiveSupport::JSON.decode(res.body)
    if @movie["Response"] == "True"
      render :details
    else
      redirect_to "/movies/seeker"
    end
  end
end