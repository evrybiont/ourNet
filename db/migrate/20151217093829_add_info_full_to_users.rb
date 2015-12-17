class AddInfoFullToUsers < ActiveRecord::Migration
  def change
    add_column :users, :info_full, :boolean, default: false
  end
end
