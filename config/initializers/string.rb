class String
  def get_album
    split('/').try(:first)
  end

  def get_name
    split('/').try(:last)
  end
end
