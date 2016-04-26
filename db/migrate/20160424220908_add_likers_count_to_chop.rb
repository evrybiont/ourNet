class AddLikersCountToChop < ActiveRecord::Migration
  def change
    add_column :chops, :likers_count, :integer, default: 0
  end
end
