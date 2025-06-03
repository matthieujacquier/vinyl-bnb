class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :album_name
      t.string :artist_name
      t.text :tracklist
      t.text :description
      t.string :genre
      t.string :youtube_url
      t.decimal :price_per_day
      t.boolean :active, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
