class Director < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :videos, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
