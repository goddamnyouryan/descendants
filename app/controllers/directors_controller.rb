class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :set_directors
  before_action :render_preview?, only: :index

  def index
  end

  def show
    @videos = @director.videos
  end

  private

  def set_directors
    @directors = Director.includes(:videos).all
  end

  def render_preview?
    render layout: 'preview', action: :preview if ENV['PREVIEW_PAGE'] && !params[:beta]
  end
end
