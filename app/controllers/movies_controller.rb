require 'net/http'

class MoviesController < ApplicationController
  def result
    title = params[:movie][:title]
    omdb = "http://www.omdbapi.com/?apikey=e4c4b604"
    url = URI.parse(omdb + '&t=' + title)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @movie = ActiveSupport::JSON.decode(res.body)
    render :result
  end
end