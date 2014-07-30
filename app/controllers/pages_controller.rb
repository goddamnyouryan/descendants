class PagesController < ApplicationController

  def joinery
    @directors = Director.joinery.includes(:videos).joins(:videos).uniq
  end
end
