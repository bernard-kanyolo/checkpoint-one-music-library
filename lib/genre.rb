class Genre < BaseModel
  extend Concerns::Findable

  attr_accessor :name, :songs

  @all = []

  def initialize(name)
    super(name)
    @songs = []
  end
  
  def artists
    @songs.map(&:artist).uniq
  end
end
