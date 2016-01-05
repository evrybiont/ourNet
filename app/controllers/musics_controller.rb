class MusicsController < ApplicationController
  BUCKET = 'ucc-music'

  before_action :authenticate_user!

  def index
    @songs = AWS::S3::Bucket.find(BUCKET).objects
  end

  def create
    AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, BUCKET, access: :public_read)
    redirect_to musics_path
  end

  private
 
  def sanitize_filename(file_name)
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end
end
