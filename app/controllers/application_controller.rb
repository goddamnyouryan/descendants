class ApplicationController < ActionController::Base
  before_action :set_content
  protect_from_forgery with: :exception

  def set_content
    @content = Content.first
  end

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

  def set_directors
    @directors = Director.normal.includes(:videos).joins(:videos).uniq
  end
end
