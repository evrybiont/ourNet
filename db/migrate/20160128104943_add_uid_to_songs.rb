class AddUidToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :uid, :integer, unique: true
  end
end
