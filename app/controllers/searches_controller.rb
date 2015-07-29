class SearchesController < ApplicationController
  def index
    @search = Search.new
    gon.username = ENV['geonames_username']
  end
  
  def create
    @ll = search_params['ll']
    @query = search_params['query']
    @near = search_params['near']
    if @query == ""
      flash.now[:notice] = "Please enter a search query"
      render 'layouts/shared/flash'
    elsif @ll == "" && @near == ""
      flash.now[:notice] = "Please enter in a neighborhood or use current location"
      render 'layouts/shared/flash'
    elsif @ll != ""
      @venues = Search.request_ll(@query, @ll)
      if @venues == "error message"
        flash.now[:notice] = "Invalid inputs"
        render 'layouts/shared/flash'
      else
        flash.now[:notice] = ""
        render 'layouts/shared/flash'
        respond_to do |format|
          format.html {render :index}
          format.js 
        end
      end
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
      if @venues == "error message"
        flash.now[:notice] = "Invalid inputs"
        render 'layouts/shared/flash'
      else
        respond_to do |format|
          format.html {render :index}
          format.js 
        end
      end
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
