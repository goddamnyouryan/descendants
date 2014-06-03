class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :render_preview?, only: :index

  def index
    @directors = Director.includes(:videos).all.map {|director| director.videos.sample }
    @recent = Video.limit(4).order('created_at desc')
  end

  def show
    @videos = @director.videos
  end

  private

  def render_preview?
    render layout: 'preview', action: :preview if ENV['PREVIEW_PAGE']
  end
end
