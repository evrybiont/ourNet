namespace :music do
  task populate: :environment do
    puts 'Populatig music...'

    bucket = 'ucc-music'
    data = AWS::S3::Bucket.find(bucket)

    album = nil
    data.each do |song|
      if song.key.include?('mp3')
        uid = song.key.get_uid
        name = song.key.get_name
        url = AWS::S3::S3Object.url_for(song.key, bucket, authenticated: false)

        audio = Song.find_or_initialize_by(name: name, url: url, uid: uid)
        album.songs.create(audio.as_json) if audio.new_record?
      else
        album = Album.find_or_create_by(name: song.key.gsub('/', ''))
        album_songs = album.songs
        s3_keys = AWS::S3::Bucket.find(bucket, prefix: album.name).map{|s| s.key} if album_songs

        album.songs.each do |album_song|
          album_song.destroy unless s3_keys.any?{|k| k[album_song.name]}
        end
      end
    end
  end
end
