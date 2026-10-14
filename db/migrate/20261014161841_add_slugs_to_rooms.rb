class AddSlugsToRooms < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :slug, :string
    add_index :rooms, :slug, unique: true
  end
end
