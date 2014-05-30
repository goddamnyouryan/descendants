class Admin::DirectorsController < Admin::BaseController
  before_action :set_director, only: [:edit, :update, :destroy]

  def new
    @director = Director.new
  end

  def edit
    @videos = @director.videos
  end

  def create
    @director = Director.new director_params

    if @director.save
      redirect_to redirect, notice: "#{@director.name} was successfully created."
    else
      render :new
    end
  end

  def update
    if @director.update director_params
      redirect_to redirect, notice: "#{@director.name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @director.destroy
    redirect_to directors_url, notice: "#{@director.name} was successfully deleted."
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end

  def redirect
    edit_admin_director_path(@director)
  end
end
