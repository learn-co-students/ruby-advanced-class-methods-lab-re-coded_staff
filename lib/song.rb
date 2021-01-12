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
    Song.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    Song.all << song
    song
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
      song_arr = filename.split(" - ")
      song = self.new
      song.name = song_arr[1].split(".")[0]
      song.artist_name = song_arr[0]
      song
  end

  def self.create_from_filename(filename)
    song_arr = filename.split(" - ")
    format = song_arr[1].split(".")[1]
    if format == "mp3"
      song = self.new_from_filename(filename)
      Song.all << song
    end    
  end
  def self.destroy_all
    Song.all.clear
  end
end
