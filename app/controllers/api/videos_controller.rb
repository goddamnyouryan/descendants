class Api::VideosController < Api::BaseController

  def show
    @video = Video.friendly.find params[:id]

    respond_with @video
  end
end
