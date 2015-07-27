class SearchesController < ApplicationController
  def index
    @search = Search.new
  end
  
  def create
    @search = Search.create(search_params)
    if @search.ll != ""
      @response = Search.request_ll(@search.query, @search.ll)
    elsif @search.near != ""
      @response = Search.request_near(@search.query, @search.near)
    end
    render :index
  end
  
  private
  
  def search_params
    params.require(:search).permit(:query, :ll, :near)
  end
end
