class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :director
  has_many :media, as: :imageable

  validates :director_id, :title, presence: true

  default_scope { order('position ASC') }

  def slug_candidates
    [
      [:client, :title]
    ]
  end

  def should_generate_new_friendly_id?
    title_changed? || client_changed?
  end

  def next
    videos = director.videos
    subsequent = videos[self.index(videos) + 1]
    subsequent = videos[0] if subsequent.nil?
    subsequent.slug
  end

  def index(array)
    hash = Hash[array.map.with_index.to_a]
    index = hash[self]
  end

  def ogg
    find_media('ogg')
  end

  def mp4
    find_media('mp4')
  end

  def thumb(style = :thumb)
    medium = media.find_by(type: 'image')
    if medium
      medium.attachment(style)
    else
      Filler::Image.new(style).url
    end
  end

  def find_media(type)
    medium = media.find_by(type: type)
    medium.attachment if medium
  end
end
