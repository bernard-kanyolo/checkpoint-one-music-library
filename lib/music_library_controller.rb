class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @view = MusicLibraryView.new
  end

  def call
    @view.home
    input
  end

  def input
    while true
      @view.prompt
      command = gets.chomp.strip.downcase

      case command
      when 'exit'
        @view.exit
        break
      when 'list songs' then @view.list_songs
      when 'list artists' then @view.list_artists
      when 'list genres' then @view.list_genres
      when 'play song'
        @view.prompt("play_song")
        num = gets.chomp.strip.to_i
        @view.play_song(num)
      when 'list artist'
        @view.prompt("list_artist")
        artist = gets.chomp.strip
        @view.list_artist(artist)
      when 'list genre'
        @view.prompt("list_genre")
        genre = gets.chomp.strip
        @view.list_genre(genre)
      else @view.default
      end
    end
  end
end
