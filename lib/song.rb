require "pry"
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
    a_song = self.new 
    a_song.save 
    a_song 
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song 
  end 
  
  def self.create_by_name(name)
    song = new_by_name(name)
    @@all << song 
    song 
  end 
  
  def self.find_by_name(name) 
    @@all.find{ |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end 
  end 
  
  def self.alphabetical 
    @@all.sort_by{ |song| song.name }
  end 
  
  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    artist = file[0]
    title = file[1].split(/[.]/)[0]
    song = self.new 
    song.name =  title
    song.artist_name = artist 
    song 
  end 
  
  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    @@all << song 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 

end
