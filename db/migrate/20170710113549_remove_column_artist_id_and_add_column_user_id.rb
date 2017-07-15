class RemoveColumnArtistIdAndAddColumnUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :artist_id
    add_column :albums, :user_id, :integer
    add_index :albums, :user_id
  end
end
