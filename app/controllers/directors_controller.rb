class DirectorsController < ApplicationController
  before_action :set_director, only: :show

  def index
    @directors = Director.all
  end

  def show
  end
end
