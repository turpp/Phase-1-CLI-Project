require 'pry'
require 'json'
require 'net/http'
require 'open-uri'
require 'awesome_print'

require_relative('../lib/genre.rb')
require_relative('../lib/movie-data.rb')
require_relative('../lib/movies.rb')
require_relative('../lib/watch_list.rb')
require_relative('../config/user_interface.rb')

Movies.movie_from_data #creates Movies from api data
Movies.create_genre_by_movie #creates Genre from my Movies. 


#-------------









