class MusicLibraryView
  def home
    puts "-- Welcome to Fake Player --"
    puts "-- Available Commands --"
    puts
  end

  def prompt(type="")
    case type
    when "play_song" then print "Which song would you like to play? "
    when "list_artist" then print "Which artist's songs would you like to view? "
    when "list_genre" then print "Which genre's songs would you like to view? "
    else print "Fake Player > "
    end
  end

  def default
    puts "No such command available"
  end

  def list_songs
    Song.all.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song(num)
    if (1..Song.all.length).include?(num)
      song = Song.all[num - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "Please enter a valid song number between 1 and #{Song.all.length}"
    end
  end

  def list_artist(artist)
    artist = Artist.find_by_name(artist)
    if artist
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "No such artist exists in the music library"
    end
  end

  def list_genre(genre)
    genre = Genre.find_by_name(genre)
    if genre
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "No such genre exists in the music library"
    end
  end

  def exit
    puts "Thank you for using Fake Player. GoodBye!"
  end
end
