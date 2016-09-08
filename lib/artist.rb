class Artist < BaseModel
  extend Concerns::Findable

  attr_accessor :name, :songs

  @all = []

  def initialize(name)
    super(name)
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    @songs.map(&:genre).uniq
  end
end
