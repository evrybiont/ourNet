class RenameDescriptionsInChops < ActiveRecord::Migration
  def change
    rename_column :chops, :descriptions, :description
  end
end
