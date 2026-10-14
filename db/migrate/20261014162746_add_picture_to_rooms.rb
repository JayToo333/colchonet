class AddPictureToRooms < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :picture, :string
  end
end
