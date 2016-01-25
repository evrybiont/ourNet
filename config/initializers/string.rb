class String
  def get_name
    split('/').last.gsub('.mp3','').strip
  end
end
