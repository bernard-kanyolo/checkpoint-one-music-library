class Genre

  @@all = []

  def initialize(name)
    @name = name
  end

  attr_accessor :name

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
end