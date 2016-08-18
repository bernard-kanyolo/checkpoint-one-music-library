class MusicImporter
  def initialize(path)
    @path = path
  end

  attr_reader :path

  def files
    Dir.entries(@path).select { |dir| dir.chomp.end_with?(".mp3")}
  end

  def import

  end
end