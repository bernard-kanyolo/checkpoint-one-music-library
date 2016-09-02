class BaseModel
  @all = []

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  class << self
    attr_reader :all

    def destroy_all
      all.clear
    end

    def create(name)
      new(name).save
    end  
  end

  def save
    self.class.all << self
    self
  end
end
