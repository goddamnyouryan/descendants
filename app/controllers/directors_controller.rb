class DirectorsController < ApplicationController
  before_action :set_director, only: :show

  def index
    @directors = Director.all
    @recent = Video.limit(5).order('created_at desc')
  end

  def show
    @videos = @director.videos
  end
end
