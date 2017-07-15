class AddFileToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :file, :string
  end
end
