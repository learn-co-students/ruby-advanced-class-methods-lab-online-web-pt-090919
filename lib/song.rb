class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  # song = Song.new_by_name("Blank Space")
  # expect(song.name).to eq("Blank Space")

  def self.create 
    # class constructor
    # initializes a song and saves it to the @@all class variable 
    # either literally or through the class method Song.all
    song = self.new
    song.save
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end
  
  def self.find_by_name(name)
    matching_song = self.all.find{|song| song.name == name }
  end
  
  # either return matching song instance with name OR 
  # create a new song and return song instance
  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    return found_song if found_song
    
    new_song = self.create_by_name(name)
    # return new_song
  end
  
  #returns all song instances in alphabetical order by song name
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    delimiters = [" - ", "."]
    # to get #>["Thundercat", "For Love I Come", "mp3"]
    file_array = filename.split(Regexp.union(delimiters)) 
    song = self.new
    song.artist_name = file_array[0]
    song.name = file_array[1]
    #the constructor should return a new Song instance
    return song
  end
  
  def self.create_from_filename(filename)
    parsed_file = self.new_from_filename(filename)
    parsed_file.save
  end 
  
  def self.destroy_all
    self.all.clear
  end
end

# class Bike
# mtn_bike = new Bike
# mtn_bike.type_mountain? => true

# Bike.type_mountain? => break because "self" does not exist
# mtn_bike = Bike.create_bike_with_type("mountain")
# mtn_bike.type_mountain? => true, works
