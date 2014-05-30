class AddSlugToDirectorsAndVideos < ActiveRecord::Migration
  def change
    add_column :directors, :slug, :string
    add_column :videos, :slug, :string
    add_index :directors, :slug, :unique => true
    add_index :videos, :slug, :unique => true
  end
end
