class MoviesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @movie = @user.movies.create(movie_params)
  end

  private
  def movie_params
    params.require(:movie).permit(:tmdbId)
  end
end
