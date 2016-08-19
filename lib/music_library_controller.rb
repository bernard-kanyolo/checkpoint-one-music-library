class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome!"
    get_input
  end

  def get_input
   while true
     print "Command me > "
     command = gets.strip.chomp.downcase

     case command
     when 'exit'
       break
     when 'list songs'
       list_songs
     when 'list artists'
       list_artists
     when 'list genres'
       list_genres
     when 'play song'
       play_song
     when 'list artist'
       list_artist
     when 'list genre'
       list_genre
     else
       puts "No such command available"
     end
   end
  end

  def list_songs
    Song.all.each_with_index { |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each{ |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each{ |genre| puts genre.name }
  end

  def play_song
    print "Which song would you like to play? "
    num = gets.strip.chomp
    song_num = num.to_i
    if (1..Song.all.length).include?(song_num)
      song = Song.all[song_num - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "Please enter a valid song number between 1 and #{Song.all.length}"
    end
  end

  def list_artist
    print "Which artist's songs would you like to view? "
    artist = Artist.find_by_name(gets.strip.chomp)
    if artist
      artist.songs.each { |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    else
      puts "No such artist exists in the music library"
    end
  end

  def list_genre
    print "Which genre's songs would you like to view? "
    genre = Genre.find_by_name(gets.strip.chomp)
    if genre
      genre.songs.each { |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    else
      puts "No such genre exists in the music library"
    end
  end
  
end