class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @view = MusicLibraryView.new
  end

  COMMANDS = { "list songs" => :list_songs,
               "list artists" => :list_artists,
               "list genres" => :list_genres,
               "play song" => :play_song,
               "list artist" => :list_artist,
               "list genre" => :list_genre,
               "help" => :help,
               "exit" => :exit }
  COMMANDS.default = :input_error

  def call
    @view.home
    @view.help(COMMANDS)
    input
  end

  def input
    begin
      command = nil
      until command == "exit"
        @view.prompt
        command = gets.chomp.strip.downcase
        send(COMMANDS[command])
      end
    rescue Interrupt
      @view.exit
    end
  end

  def list_songs
    Song.all.each_with_index { |song, i| @view.list_song(song, :numbered, i) }
  end

  def list_artists
    Artist.all.each { |artist| @view.list_artist(artist) }
  end

  def list_genres
    Genre.all.each { |genre| @view.list_genre(genre) }
  end

  def play_song
    @view.prompt(:play_song)
    num = gets.chomp.strip
    if num.to_i.to_s == num
      fetch_song(num.to_i)
    else
      @view.input_error(:number)
    end
  end

  def fetch_song(num)
    if Song.all.empty?
      @view.input_error(:none)
    elsif (1..Song.all.length).cover?(num)
      @view.list_song(Song.all[num - 1], :playing)
    else
      @view.input_error(:exist, "song")
    end
  end

  def list_artist
    @view.prompt(:list_artist)
    artist = Artist.find_by_name(gets.chomp.strip)
    if artist
      artist.songs.each { |song| @view.list_song(song) }
    else
      @view.input_error(:exist, "artist")
    end
  end

  def list_genre
    @view.prompt(:list_genre)
    genre = Genre.find_by_name(gets.chomp.strip)
    if genre
      genre.songs.each { |song| @view.list_song(song) }
    else
      @view.input_error(:exist, "genre")
    end
  end

  def exit
    @view.exit
  end

  def help
    @view.help(COMMANDS)
  end

  def input_error
    @view.input_error
  end
end
