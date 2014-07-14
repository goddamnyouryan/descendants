class Director < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :videos, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  default_scope { order('position ASC') }
  scope :joinery, -> { where(joinery: true) }
  scope :normal, -> { where(joinery: false) }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def image(style = :hero)
    medium = Medium.where(video_id: videos.map(&:id), type: 'image')
    medium.present? ? medium.sample.attachment(style) : Filler::Image.new(style).url
  end

  def featured
    videos.sample
  end
end
