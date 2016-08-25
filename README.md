[![Build Status](https://travis-ci.org/andela-bkanyolo/checkpoint-one-music-library.svg?branch=develop)](https://travis-ci.org/andela-bkanyolo/checkpoint-one-music-library)

# Fake Player

## Overview

This is a Command Line Application that reads from the specified path and then 
imports all the mp3 files into its library. 

## Available Commands

- list songs - List all the songs in the music library
- list artists - List all the artists in the music library
- list genres - List all the genres in the music library
- play song - Play a song by specifying its number
- list artist - List all the songs in the library for specified artist
- list genre - List all the songs in the library for the specified genre
- help - List all the available commands
- exit - Close and exit the application

## Installation, setup and running
- You'll need ruby installed and the ruby gem ```bundle``` 
- Clone this repository 
```git
git clone https://github.com/andela-bkanyolo/checkpoint-one-music-library.git
```
- Navigate into the directory
- Install dependencies
```ruby
bundle install
```
- Run the application
```ruby
ruby bin/musiclibrary
```
- Run the tests
```ruby
bundle exec rspec
```

## Pitfalls

- The commands ```play song``` ```list artist``` and ```list genre``` must be run as
 they are then specify the input afterwards as opposed to appending the argument straight
  after the command 
- The command ```play song``` prompts for the song number rather than the song name
- There is currently no way of specifying a different path for the mp3 files