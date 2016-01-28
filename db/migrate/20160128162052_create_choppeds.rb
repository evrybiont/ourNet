class CreateChoppeds < ActiveRecord::Migration
  def change
    create_table :choppeds do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :descriptions
      t.timestamps null: false
    end
  end
end
