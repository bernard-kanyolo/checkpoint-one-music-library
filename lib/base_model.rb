class BaseModel
  @all = []

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  class << self
    attr_reader :all
  end

  def save
    self.class.all << self
    self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new(name).save
  end
end
