class AddColumnsToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :creation_year, :string
    add_column :movies, :genre, :string
  end
end
