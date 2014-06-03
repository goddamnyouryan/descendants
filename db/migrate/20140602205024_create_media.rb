class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :video_id
      t.string :direct_upload_url
      t.boolean :processed
      t.string :type

      t.timestamps
    end
  end
end
