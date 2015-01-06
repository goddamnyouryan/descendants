class Director < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :videos, dependent: :destroy
  has_many :media, as: :imageable

  validates :name, presence: true, uniqueness: true

  default_scope { order('directors.position ASC') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :joinery, -> { where(joinery: true) }
  scope :normal, -> { where(joinery: false) }

  attr_accessor :hero

  before_save :upload_hero, if: :hero?

  def hero?
    hero.present?
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  def image(style = :hero)
    medium = Medium.where(imageable_id: videos.map(&:id), imageable_type: 'Video', type: 'image')
    medium.present? ? medium.sample.attachment(style) : Filler::Image.new(style).url
  end

  def hero_image(style = :hero)
    media.present? ? media.first.attachment(style) : featured.thumb(style)
  end

  def featured
    videos.first
  end

  private

  def upload_hero
    medium = Medium.find_or_initialize_by(imageable_type: 'Director', imageable_id: id, type: 'image')
    medium.attachment = hero
    medium.save
  end
end
