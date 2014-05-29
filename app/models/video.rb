class Video < ActiveRecord::Base
  belongs_to :director

  validates :director_id, :title, :client, presence: true
end
