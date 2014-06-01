class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :render_preview?, only: :index

  def index
    @directors = Director.all
    @recent = Video.limit(5).order('created_at desc')
  end

  def show
    @videos = @director.videos
  end

  private

  def render_preview?
    render layout: 'preview', action: :preview if ENV['PREVIEW_PAGE']
  end
end
