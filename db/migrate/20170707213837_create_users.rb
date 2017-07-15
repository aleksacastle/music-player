class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nick_name
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
