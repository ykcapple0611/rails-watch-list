class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :posted_url
      t.decimal :rating, precision:1

      t.timestamps
    end
  end
end
