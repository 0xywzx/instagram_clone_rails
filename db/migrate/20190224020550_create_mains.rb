class CreateMains < ActiveRecord::Migration[5.1]
  def change
    create_table :mains do |t|
      t.text :comment
      t.text :image

      t.timestamps
    end
  end
end
