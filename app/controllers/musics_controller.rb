class MusicsController < ApplicationController
  BUCKET = 'ucc-music'
  ALBUMS_BUCKET = 'ucc-music-albums'

  before_action :authenticate_user!

  def dashboards
    respond_formats
  end

  def list
    respond_formats
  end

  def albums
    respond_formats
  end

  def index
    data = AWS::S3::Bucket.find(ALBUMS_BUCKET, prefix: params[:dir])
    render json: prepare_songs(data)
  end

  def create
    AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, BUCKET, access: :public_read)
    redirect_to root_path
  end

  private
 
  def sanitize_filename file_name
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end

  def prepare_songs data
    data.map do |song|
      if song.key.include?('mp3')
        {
          album: song.key.get_album,
          name: song.key.get_name,
          url: AWS::S3::S3Object.url_for(song.key, ALBUMS_BUCKET, authenticated: false)
        }
      end
    end.compact
  end
end
