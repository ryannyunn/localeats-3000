class SearchesController < ApplicationController
  def index
    @search = Search.new
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
      render :index
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
      render :index
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
