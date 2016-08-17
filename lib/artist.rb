class Artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  attr_accessor :name
  attr_accessor :songs

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

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end
end