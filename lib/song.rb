class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    all.detect { |s| s.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    name_arr = filename.split(' - ')
    artist_name = name_arr[0]
    song_name = name_arr[1].gsub('.mp3', '')

    song = new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    name_arr = filename.split(' - ')
    artist_name = name_arr[0]
    song_name = name_arr[1].gsub('.mp3', '')

    song = create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    all.clear
  end
end
