class MusicLibraryView
  require "colorize"

  def home
    welcome = "Welcome to Empty Player"
    puts "\n\n"
    puts "-".black.on_white * 80
    puts "#{" " * 27} #{welcome} #{" " * 28}".black.on_white.center(80)
    puts "-".black.on_white * 80
  end

  def prompt(type = nil)
    case type
    when :play_song
      print "Which song number would you like to play? ".light_green
    when :list_artist
      print "Which artist's songs would you like to view? ".light_green
    when :list_genre
      print "Which genre's songs would you like to view? ".light_green
    else
      print "Empty Player > ".green
    end
  end

  def list_song(song, context = nil, i = 0)
    case context
    when :numbered
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    when :playing
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist(artist)
    puts artist.name
  end

  def list_genre(genre)
    puts genre.name
  end

  def input_error(context = nil, model = nil)
    case context
    when :number then puts "Invalid song number entered".red
    when :exist then puts "No such #{model} exists in the music library".red
    when :none then puts "Sorry there are no songs in the music library".red
    else puts "No such command available".red
    end
  end

  def help(commands)
    puts ""
    puts "-- Available Commands --".light_cyan.underline.center(80)
    commands.each_key { |key| puts key.light_blue.center(80) }
    puts ""
  end

  def exit
    puts "Thank you for using Empty Player. GoodBye!".light_cyan
  end
end
