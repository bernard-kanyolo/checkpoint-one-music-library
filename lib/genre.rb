class Genre

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
    Genre.new(name).save
  end

  def artists
    @songs.collect{|song| song.artist }.uniq
  end
end