class AddFieldToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :released_on, :datetime
    add_column :movies, :description, :text
  end
end
