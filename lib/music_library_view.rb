class MusicLibraryView
  def home
    puts "-- Welcome to Empty Player --".center(30)
    puts "-- Available Commands --"
  end

  def prompt(type = nil)
    case type
    when :play_song then print "Which song number would you like to play? "
    when :list_artist then print "Which artist's songs would you like to view? "
    when :list_genre then print "Which genre's songs would you like to view? "
    else print "Empty Player > "
    end
  end

  def list_song (song, context = nil, i = 0)
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
    when :number then puts "Invalid song number entered"
    when :exist then puts "No such #{model} exists in the music library"
    when :none then puts "Sorry there are no songs in the music library"
    else puts "No such command available"
    end
  end

  def help
    puts "Available commands: "
  end

  def exit
    puts "Thank you for using Empty Player. GoodBye!"
  end
end
