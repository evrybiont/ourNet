class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :chop, index: true
      t.attachment :data
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end
