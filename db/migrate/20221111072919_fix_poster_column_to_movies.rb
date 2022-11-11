class FixPosterColumnToMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :posted_url
    add_column :movies, :poster_url, :string
  end
end
