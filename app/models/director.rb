class Director < ActiveRecord::Base
  has_many :videos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
