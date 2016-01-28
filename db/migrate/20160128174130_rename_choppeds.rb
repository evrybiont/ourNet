class RenameChoppeds < ActiveRecord::Migration
  def change
    rename_table :choppeds, :chops
  end
end
