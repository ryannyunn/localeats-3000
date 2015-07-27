class SearchesController < ApplicationController
  def index
    @search = Search.new
  end
  
  def create
    @ll = search_params['ll']
    @query = search_params['query']
    @near = search_params['near']
    if @ll != ""
      @venues = Search.request_ll(@query, @ll)
    elsif @near != ""
      @venues = Search.request_near(@query, @near)
    end
    render :index
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
