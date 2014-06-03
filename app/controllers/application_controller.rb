class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_director
    @director = Director.friendly.find director_id
  end

  def director_id
    params[:director_id] || params[:id]
  end

  def set_video
    @video = Video.friendly.find video_id
  end

  def video_id
    params[:video_id] || params[:id]
  end
end
