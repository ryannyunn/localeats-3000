class SearchesController < ApplicationController
  def index
    @search = Search.new
    gon.username = ENV['geonames_username']
  end
  
  def create
    @ll = search_params['ll']
    @query = search_params['query']
    @near = search_params['near']
    gon.global.google_map_array = []
    if @ll != ""
      binding.pry
      @venues = Search.request_ll(@query, @ll)
      @venues.each.with_index(1).map do |venue, i| 
        longitude = venue['venue']['location']['lng']
        latitude = venue['venue']['location']['lat']
        name = venue['venue']['name']
        gon.global.google_map_array << [name, latitude, longitude, i]
      end
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
    end
    binding.pry
    respond_to do |format|
      format.html {render :index}
      format.js 
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
