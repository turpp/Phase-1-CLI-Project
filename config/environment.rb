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
$clean_data = MovieData.new.get_movies_pages #global variable to store the information from my api. that way I only have to make 1 request to speed up the program
Movies.movie_from_data #creates Movies from api data
Movies.create_genre_by_movie #creates Genre from my Movies. 


#-------------









