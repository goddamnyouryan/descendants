class AddHeadLineToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :headline, :text
  end
end
