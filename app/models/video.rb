class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :director

  validates :director_id, :title, :client, presence: true

  def slug_candidates
    [
      [:client, :title]
    ]
  end

  def should_generate_new_friendly_id?
    title_changed? || client_changed?
  end
end
