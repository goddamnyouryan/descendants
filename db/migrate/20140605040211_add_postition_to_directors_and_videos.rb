class AddPostitionToDirectorsAndVideos < ActiveRecord::Migration
  def change
    add_column :directors, :position, :integer
    add_column :videos, :position, :integer
  end
end
