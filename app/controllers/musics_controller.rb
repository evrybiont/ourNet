class MusicsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permissions!

  def dashboards
    respond_formats
  end

  def list
    respond_formats
  end

  def albums
    @albums = Album.all
    respond_formats
  end

  def index
    songs = if params[:dir]
      album = Album.friendly.find(params[:dir])
      album.songs.order(:uid)
    else
      Song.all
    end

    render json: songs
  end

  def show
    respond_formats
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
end
