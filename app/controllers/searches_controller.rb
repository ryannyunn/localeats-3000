class SearchesController < ApplicationController
  
  def index
    @search = Search.new
    gon.google_geocoder = ENV['google_geocoder']
  end
  
  def create
    @ll = search_params['ll']
    @query = search_params['query']
    @near = search_params['near']
    @google_map_locs = []
    if @ll != ""
      @venues = Search.request_ll(@query, @ll)
      @venues.each.with_index(1).map do |venue, i| 
        longitude = venue['venue']['location']['lng']
        latitude = venue['venue']['location']['lat']
        name = venue['venue']['name']
        address = venue['venue']['location']["formattedAddress"]
        rating = venue['venue']['rating']
        @google_map_locs << [name, latitude, longitude, i, address, rating]
      end
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
      @venues.each.with_index(1).map do |venue, i| 
        longitude = venue['venue']['location']['lng']
        latitude = venue['venue']['location']['lat']
        name = venue['venue']['name']
        address = venue['venue']['location']["formattedAddress"]
        rating = venue['venue']['rating']
        @google_map_locs << [name, latitude, longitude, i, address, rating]
      end
    end
    respond_to do |format|
      format.html {render :index}
      format.js
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near, :random_fact)
  end
end
