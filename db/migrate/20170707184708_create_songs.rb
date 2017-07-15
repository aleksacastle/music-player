class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string  :title
      t.string  :artist
      t.integer :duration
      t.integer :album_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
