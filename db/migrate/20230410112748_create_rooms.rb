class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :city
      t.integer :price

      t.timestamps
    end
  end
end