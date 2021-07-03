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

  private
  def movie_params
    params.require(:movie).permit(:tmdbId)
  end
end
