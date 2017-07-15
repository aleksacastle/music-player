class CreatePlaylist < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :file_cover

      t.timestamps
    end
  end
end
