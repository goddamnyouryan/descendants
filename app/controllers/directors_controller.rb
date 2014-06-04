class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :set_directors
  before_action :render_preview?, only: :index

  def index
    @recent = Video.limit(4).order('created_at desc')
  end

  def show
    @videos = @director.videos
  end

  private

  def set_directors
    @directors = Director.includes(:videos).all.map {|director| director.videos.sample }
  end

  def render_preview?
    render layout: 'preview', action: :preview if ENV['PREVIEW_PAGE']
  end
end
