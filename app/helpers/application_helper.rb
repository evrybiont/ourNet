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
      button_tag name, title: "#{name} #{user.name}", class: 'button toggle_follow',
                 data: {page: page, uid: uid, action: toggle_follow_user_path(user), behavior: 'ToggleFollow'}
    end
  end

  def like_title tagged, chop
    text = u.likes?(chop) ? 'Unstar' : 'Star'
    if tagged
      content_tag(:div, text, class: 'title')
    else
      text = text=='Unstar' ? 'Не подобається' : 'Подобається'
      "#{text} #{chop.name}"
    end
  end

  def star_title chop
    text = u.likes?(chop) ? 'Unstar' : 'Star'
    title = text=='Unstar' ? 'Не подобається' : 'Подобається'
    id = chop.name.gsub(' ','_')
    content_tag(:span, text, id: id, class: 'pointer star-click', title: "#{title} #{chop.name}", data: {action: like_chop_path(chop), tag: id})
  end

  def highlight user
    u.follows?(user) ? 'unfollow' : 'follow'
  end

  def star_blank_content data
    if data.blank?
      who = u.id == params[:id].to_i ? 'You' : @user.name
      if who == 'You'
        msg = "You don’t have any starred chops yet."
      else
        msg = "#{who} doesn’t have any starred chops yet."
      end
      content_tag(:p, msg, class: 'blank-content')
    end
  end

  def people_blank_content data, type
    if data.blank?
      who = u.id == params[:id].to_i ? 'You' : @user.name
      if type == 'followers'
        if who == 'You'
          msg = "You don’t have any followers."
        else
          msg = "#{who} doesn’t have any followers."
        end
      else
        if who == 'You'
          msg = "You aren’t following anybody."
        else
          msg = "#{who} isn’t following anybody."
        end
      end

      content_tag(:p, msg, class: 'blank-content')
    end
  end

  def youtube_video(url)
    id = url.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{id}", allowfullscreen: true)
  end

  def tabs_blank_content term, data
    if data.blank?
      who = u.id == params[:id].to_i ? 'You' : @user.name
      if who == 'You'
        msg = "You don’t have any #{term} yet."
      else
        msg = "#{who} doesn’t have any #{term} yet."
      end
      content_tag(:p, msg, class: 'blank-content')
    end
  end
end
