class AddTableUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users
  end
end
