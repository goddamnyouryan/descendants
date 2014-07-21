class AddImageAbleToMedium < ActiveRecord::Migration
  def change
    add_column :media, :imageable_id, :integer
    add_column :media, :imageable_type, :string
    Medium.all.each do |medium|
      medium.imageable_id = medium.video_id
      medium.imageable_type = 'Video'
      medium.save!
    end
    remove_column :media, :video_id
  end
end
