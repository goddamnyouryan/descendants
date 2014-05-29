class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_director
    @director = Director.find director_id
  end

  def director_id
    params[:director_id] || params[:id]
  end
end
