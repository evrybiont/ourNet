class AddAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
