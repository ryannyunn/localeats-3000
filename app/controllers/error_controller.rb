class ErrorController < ApplicationController
  def error_400
    @not_found_path = params[:not_found]
  end

  def error_500
  end
end
