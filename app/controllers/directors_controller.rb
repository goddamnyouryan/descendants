class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :set_directors, only: :index
  before_action :render_preview?, only: :index

  def index
    @joinery_featured = Director.joinery.first.featured
  end

  def show
    @videos = @director.videos
  end

  private

  def render_preview?
    render layout: 'preview', action: :preview if ENV['PREVIEW_PAGE'] && !params[:beta]
  end
end
