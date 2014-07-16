class PagesController < ApplicationController

  def the_joinery
    @directors = Director.joinery.includes(:videos).joins(:videos).uniq
  end
end
