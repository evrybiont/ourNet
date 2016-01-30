class AddSlugToChops < ActiveRecord::Migration
  def change
    add_column :chops, :slug, :string, unique: true
  end
end
