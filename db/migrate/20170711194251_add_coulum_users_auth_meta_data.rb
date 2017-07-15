class AddCoulumUsersAuthMetaData < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :auth_meta_data, :text
  end
end
