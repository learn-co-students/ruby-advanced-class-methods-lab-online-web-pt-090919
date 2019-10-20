class Song
 attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
end

  def Song.create
    song = Song.create
    Song.all.include?("hot girl")
  end
  
  
  def Song.new_by_name("blinded")
    song = song.new_by_name
  end

 
 
 
 
