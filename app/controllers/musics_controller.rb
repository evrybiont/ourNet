class MusicsController < ApplicationController
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
    render json: Song.all
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
