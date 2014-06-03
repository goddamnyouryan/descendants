class AddAttachmentToMedia < ActiveRecord::Migration
  def change
    add_attachment :media, :attachment
  end
end
