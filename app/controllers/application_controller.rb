class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_director
    @director = Director.find params[:id]
  end
end
