require 'net/http'

class MoviesController < ApplicationController

  def index
    unless session[:user_id]
      redirect_to root_path
    end
    tmdb = 'https://api.themoviedb.org/3/movie/popular?api_key=' + ENV['TMDB_API_KEY'] + '&language=en-US&page=1'
    url = URI.parse(tmdb)

    res = Net::HTTP.get(url)
    @response = ActiveSupport::JSON.decode(res)

    if @response["total_results"] != 0
      @movies = @response["results"]
      render :index
    end
  end


  def results
    if params[:movie] != nil
      $title = params[:movie][:title]
      $year = params[:movie][:year]
    end
    tmdb = "https://api.themoviedb.org/3/search/movie?api_key="
    url = URI.parse(tmdb + ENV['TMDB_API_KEY'] + '&query=' + $title + '&year=' + $year)
    
    res = Net::HTTP.get(url)
    @response = ActiveSupport::JSON.decode(res)

    if @response["total_results"] != 0
      @movies = @response["results"]
      render :results
    else
      redirect_to "/movies/seeker"
    end
  end
  
  def find_by_id
    id = params[:id]
    url = URI.parse('https://api.themoviedb.org/3/movie/' + id + '?api_key='+ ENV['TMDB_API_KEY']  +'&language=en-US')
    res = Net::HTTP.get(url)
    @movie = ActiveSupport::JSON.decode(res)

    if @movie["success"] != false
      render :details
    else
      redirect_to "/movies/seeker"
    end
  end
end