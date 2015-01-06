class AddActiveToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :active, :boolean, null: false, default: false

    Director.all.each do |director|
      director.update_attribute :active, true
    end
  end
end
