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

  def display_avatar user, can_change
    title = can_change ? 'Change your avatar' : 'Avatar'
    pointer = can_change ? 'pointer' : ''
    if user.avatar.present?
      image_tag user.avatar.url(:medium), class: "done #{pointer}", title: title
    else
      if u.male?
        content_tag(:div, nil, class: "male-avatar #{pointer}", title: title)
      else
        content_tag(:div, nil, class: "female-avatar #{pointer}", title: title)
      end
    end
  end

  def follow_button page, uid, user
    unless u == user
      name = u.follows?(user) ? 'Unfollow' : 'Follow'
      button_tag name, title: "#{name} #{user.name}", class: 'button toggle_follow', data: {page: page, uid: uid, action: toggle_follow_user_path(user)}
    end
  end

  def highlight user
    u.follows?(user) ? 'unfollow' : 'follow'
  end
end
