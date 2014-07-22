class Admin::ContentsController < Admin::BaseController
  def edit
  end

  def update
    @content.update content_params
    if @content.save
      redirect_to admin_root_path, notice: 'Site content updated.'
    else
      render :edit
    end
  end

  private

  def content_params
    params.require(:content).permit(:about_headline, :about_body, :joinery_headline, :joinery_body)
  end
end
