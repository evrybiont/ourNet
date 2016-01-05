module ApplicationHelper
  BUCKET = 'ucc-music'

  def active term
    if params[:controller] == term
      'active'
    end
  end

  def hash_select hash
    options_from_collection_for_select(hash.map{|col| [col[0], col[1]]}, :first, :last, hash.key(u.user_type))
  end

  def _for col
    col.try(:blank?)
  end

  def download_url_for(song_key)
    AWS::S3::S3Object.url_for(song_key, BUCKET, :authenticated => false)
  end
end
