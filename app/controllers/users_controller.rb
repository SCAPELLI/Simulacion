require 'net/http'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @movies = []
    @user.movies.each { |movie|
      @movies.append(find_movie_by_id(movie.tmdbId))
    }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:password, :name, :lastName)
  end

  def find_movie_by_id(id)
    url = URI.parse('https://api.themoviedb.org/3/movie/' + id + '?api_key='+ ENV['TMDB_API_KEY']  +'&language=en-US')
    res = Net::HTTP.get(url)
    ActiveSupport::JSON.decode(res)
  end
end
