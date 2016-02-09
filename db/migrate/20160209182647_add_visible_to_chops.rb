class AddVisibleToChops < ActiveRecord::Migration
  def change
    add_column :chops, :visible, :boolean, default: true
  end
end
