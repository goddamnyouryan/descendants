class Content < ActiveRecord::Base
  attr_accessor :joinery_hero

  has_one :medium, as: :imageable

  before_save :upload_joinery_hero, if: :joinery_hero?

  def joinery_hero?
    joinery_hero.present?
  end

  def joinery_hero_image
    medium.present? ? medium.attachment(:hero) : Director.joinery.first.featured.thumb(:hero)
  end

  private

  def upload_joinery_hero
    medium = Medium.find_or_initialize_by(imageable_type: 'Content', imageable_id: id, type: 'image')
    medium.attachment = joinery_hero
    medium.save
  end
end
