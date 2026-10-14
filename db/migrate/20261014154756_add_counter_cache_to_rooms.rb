class AddCounterCacheToRooms < ActiveRecord::Migration[8.1]
  def change
    add_column :rooms, :reviews_count, :integer
  end
end
