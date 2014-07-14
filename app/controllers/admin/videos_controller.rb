class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: [:edit, :update, :destroy]
  before_action :set_director

  def new
    @video = Video.new
  end

  def create
    @video = @director.videos.build video_params

    if @video.save
      redirect_to edit_admin_director_video_path(@director, @video), notice: "#{@video.title} added to #{@director.name}. Please upload files."
    else
      render :new
    end
  end

  def edit
    @media = @video.media
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

  def sort
    params[:video].each_with_index do |id, index|
      Video.where(id: id).update_all position: index + 1
    end

    render nothing: true
  end

  private

  def video_params
    params.require(:video).permit(:title, :client, :agency)
  end
end
