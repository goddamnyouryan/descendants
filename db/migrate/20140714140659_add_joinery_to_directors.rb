class AddJoineryToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :joinery, :boolean, null: false, default: false
  end
end
