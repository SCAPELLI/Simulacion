require 'net/http'

class MoviesController < ApplicationController
  def index
    unless session[:user_id]
      redirect_to root_path
    end
    url = URI.parse('http://www.omdbapi.com/?apikey=e4c4b604&t=grand+blue')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @movie = ActiveSupport::JSON.decode(res.body)
  end
end
