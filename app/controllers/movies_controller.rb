require 'net/http'

class MoviesController < ApplicationController
  def index
    unless session[:user_id]
      redirect_to root_path
    end
    omdb = "http://www.omdbapi.com/?apikey=e4c4b604"
    url = URI.parse(omdb + '&t=grand+blue')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @movie = ActiveSupport::JSON.decode(res.body)
  end

  def seeker
    title = params[:movie][:title]
    omdb = "http://www.omdbapi.com/?apikey=e4c4b604"
    url = URI.parse(omdb + '&t=' + title)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @movie = ActiveSupport::JSON.decode(res.body)
    # redirect_to "/movies"
    render :seeker
  end
end
