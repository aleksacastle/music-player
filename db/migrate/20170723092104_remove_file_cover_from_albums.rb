class RemoveFileCoverFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :file_cover, :string
  end
end
