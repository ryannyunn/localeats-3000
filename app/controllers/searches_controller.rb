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
      flash[:notice] = "Please enter a search query"
      redirect_to root_path
    elsif @ll == "" && @near == ""
      flash[:notice] = "Please enter in a neighborhood or use current location"
      redirect_to root_path
    elsif @ll != ""
      @venues = Search.request_ll(@query, @ll)
      if @venues == "error message"
        flash[:notice] = "Invalid inputs"
        redirect_to root_path
      else
        render :index
      end
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
      if @venues == "error message"
        flash[:notice] = "Invalid inputs"
        redirect_to root_path
      else
       # binding.pry
        render :index

      end
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
