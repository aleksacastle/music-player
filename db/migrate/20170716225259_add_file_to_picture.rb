class AddFileToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :file, :string
  end
end
