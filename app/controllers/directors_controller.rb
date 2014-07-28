class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :set_directors, only: :index

  def index
    @joinery_featured = Director.joinery.first.featured
  end

  def show
    @videos = @director.videos
  end
end
