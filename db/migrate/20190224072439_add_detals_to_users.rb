class AddDetalsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string, unique: true
    add_column :users, :image, :text
  end
end
