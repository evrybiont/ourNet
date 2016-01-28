class String
  def get_name
    split('/').last.split('__').last.gsub('.mp3','').strip
  end

  def get_uid
    split('/').last.split('__').first
  end
end
