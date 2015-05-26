class DirectorsController < ApplicationController
  before_action :set_director, only: :show
  before_action :set_directors, only: :index

  def index
    joinery = Director.joinery.first
    @joinery_featured = joinery.present? ? joinery.featured : nil
  end

  def show
    @videos = @director.videos
  end
end
