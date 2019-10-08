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
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
        self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    artists_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artists_name
    song
  end
  
  def self.create_from_filename(filename)
    artists_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split(".")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artists_name
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end





# rows = csv_data.split("\n")
#     # For each row, let's collect a Person instance based on the data
#     people = rows.collect do |row|
#       # Split the row into 3 parts, name, age, company, at the ", "
#       data = row.split(", ")
#       name = data[0]
#       age = data[1]
#       company = data[2]
 
#       # Make a new instance
#       person = self.new # self refers to the Person class. This is Person.new
#       # Set the properties on the person.
#       person.name = name
#       person.age = age
#       person.company = company
#       # Return the person to collect
#       person
#     end
#     # Return the array of newly created people.
#     people
