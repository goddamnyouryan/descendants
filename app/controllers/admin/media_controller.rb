class Admin::MediaController < Admin::BaseController
  before_action :set_video
  before_action :set_director, only: :destroy

  def create
    @video.media.create media_params
    render nothing: true
  end

  def destroy
    @medium = Medium.find params[:id]
    @medium.destroy
    redirect_to edit_admin_director_video_path(@director, @video), notice: "#{@medium.attachment_file_name} deleted."
  end

  private

  def media_params
    {
      direct_upload_url: CGI.unescape(params[:url]),
      attachment_file_name: params[:filename],
      attachment_content_type: params[:filetype],
      attachment_file_size: params[:filesize]
    }
  end
end
