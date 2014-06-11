class Api::DirectorsController < Api::BaseController

  def show
    @director = Director.friendly.find params[:id]
    @videos = @director.videos
    @featured = @director.featured

    respond_with @director
  end
end
