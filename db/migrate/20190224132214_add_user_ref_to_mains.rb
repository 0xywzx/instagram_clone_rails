class AddUserRefToMains < ActiveRecord::Migration[5.1]
  def change
    add_reference :mains, :user, foreign_key: true
  end
end
