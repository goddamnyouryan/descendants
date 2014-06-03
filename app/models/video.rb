class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :director
  has_many :media

  validates :director_id, :title, :client, presence: true

  def slug_candidates
    [
      [:client, :title]
    ]
  end

  def should_generate_new_friendly_id?
    title_changed? || client_changed?
  end

  def ogg
    find_media('ogg')
  end

  def mp4
    find_media('mp4')
  end

  def thumb(style = :thumb)
    medium = media.find_by(type: 'image')
    medium.attachment(style) if medium
  end

  def find_media(type)
    medium = media.find_by(type: type)
    medium.attachment if medium
  end
end
