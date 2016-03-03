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

  def go_back?
    request.headers['HTTP_REFERER'].present? && not_same?
  end

  def display_avatar
    if u.avatar.present?
      image_tag current_user.avatar.url(:medium), class: 'done pointer', title: 'Change your avatar'
    else
      if u.male?
        content_tag(:div, nil, class: 'male-avatar', title: 'Change your avatar')
      else
        content_tag(:div, nil, class: 'female-avatar', title: 'Change your avatar')
      end
    end
  end

  private

  def not_same?
    request.headers['HTTP_REFERER'] != request.headers['REQUEST_URI']
  end
end
