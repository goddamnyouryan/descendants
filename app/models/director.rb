class Director < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :videos, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  default_scope { order('position ASC') }

  def should_generate_new_friendly_id?
    name_changed?
  end

  def image(style = :original)
    medium = Medium.where(video_id: videos.map(&:id), type: 'image')
    medium.present? ? medium.sample.attachment(style) : Filler::Image.new(width: 285, height: 160).url
  end
end
