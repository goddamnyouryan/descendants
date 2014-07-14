class AddAgencyToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :agency, :string
  end
end
