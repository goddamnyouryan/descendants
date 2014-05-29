class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :director_id
      t.string :title
      t.string :client

      t.timestamps
    end
  end
end
