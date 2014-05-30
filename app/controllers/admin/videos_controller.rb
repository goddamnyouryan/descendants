class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: [:edit, :update, :destroy]
  before_action :set_director

  def new
    @video = Video.new
  end

  def create
    @video = @director.videos.build video_params

    if @video.save
      redirect_to edit_admin_director_path(@director), notice: "#{@video.title} added to #{@director.name}."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @video.update video_params
      redirect_to edit_admin_director_path(@director), notice: "#{@video.title} updated."
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to edit_admin_director_path(@director), notice: "#{@video.title} deleted."
  end

  private

  def set_video
    @video = Video.friendly.find params[:id]
  end

  def video_params
    params.require(:video).permit(:title, :client)
  end
end
