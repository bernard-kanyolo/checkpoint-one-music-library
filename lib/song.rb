class Song
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist
      artist.add_song(self) unless artist.songs.include?(self)
    end
    @genre = genre
    if genre
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  attr_accessor :name
  attr_reader :artist
  attr_reader :genre

  # setter for artist
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # setter for genre
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).save
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp('.mp3').split(' - ').collect { |e| e.strip }
    Song.new(name, Artist.create(artist), Genre.create(genre))
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

end