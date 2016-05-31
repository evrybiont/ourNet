class AddYoutubeUrlToChops < ActiveRecord::Migration
  def change
    add_column :chops, :youtube_url, :string
  end
end
