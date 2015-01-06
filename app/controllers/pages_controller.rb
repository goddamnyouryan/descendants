class PagesController < ApplicationController

  def joinery
    @directors = Director.joinery.active.includes(:videos).joins(:videos).uniq
  end
end
