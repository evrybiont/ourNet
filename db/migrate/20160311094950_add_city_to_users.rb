class AddCityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locality, :string
  end
end
