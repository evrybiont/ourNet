class AddLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :link, :string, unique: true
  end
end
