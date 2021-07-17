require "prawn"
require 'thread'

class MoviesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @movie = @user.movies.create(movie_params)
    redirect_to request.referrer
  end

  def destroy
    @user = User.find(params[:user_id])
    @movie = @user.movies.where(tmdbId: params[:tmdbId]).first
    @movie.destroy
    redirect_to request.referrer
  end

  def export
    begin
      user = User.find(params[:id])
      file_data = generate_file(user)
    rescue
      file_data = "Error exportando"
    ensure
      send_data file_data, :filename => 'liked_movies.txt'
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:tmdbId)
  end

  def generate_file(user)
    mutex = Mutex.new
    threads = []
    movies = ""
    threads << Thread.new {
      for i in 0..user.movies.length/2-1 do
        name = find_movie_by_id(user.movies[2*i].tmdbId)
        mutex.synchronize do
          movies += name + " - T1\n"
        end
      end
    }
    threads << Thread.new {
      for i in 0..user.movies.length/2-1 do
        name = find_movie_by_id(user.movies[2*i+1].tmdbId)
        mutex.synchronize do
          movies += name + " - T2\n"
        end
      end
    }
    threads.each { |aThread|  aThread.join }
    movies
  end

  def find_movie_by_id(id)
    url = URI.parse('https://api.themoviedb.org/3/movie/' + id + '?api_key='+ ENV['TMDB_API_KEY']  +'&language=en-US')
    res = Net::HTTP.get(url)
    json = ActiveSupport::JSON.decode(res)
    json["title"]
  end
end
