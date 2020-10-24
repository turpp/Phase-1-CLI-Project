#-------file outline----------------
#movies belongs to genre
#Movies has a title, genre, rating
#This will give me a list of all the movies
#it will give me a way to get more detial about each movie
#it will take data from MovieData and create instances with it.
#-------------------------------------

class Movies
attr_accessor :title, :genre, :rating
@@all = []
    def initialize(title,genre,rating)
        @title = title
        @genre=genre
        @rating=rating
        @@all << self
    end

    def self.all #allows me to have a list of all Movies
        @@all
    end

    def self.movie_from_data #creates intances from data collected from API.
        movie_data = MovieData.new
        all_titles = movie_data.movie_title_genre
        all_titles.each do |hsh|
            Movies.new(hsh[:original_title],hsh[:genre_ids],hsh[:vote_average]) #api data has lots of extra info. this allows us to only pull title, id and rating.
            end
    self.convert_ids 
    end

    def self.sort_by_rating #this organize the movies by the ratings in descending order. 
        sorted_array=@@all.sort_by{|movie| movie.rating}.reverse
    end

    def self.convert_ids #data has genre as id number. this converts them to words for easy reading.
    Movies.all.each do |movies|  
            case
            when movies.genre == 28
                movies.genre =("Action")
            when movies.genre == 35
                movies.genre="Comedy"
            when movies.genre == 53
                movies.genre ="Thriller"
            when movies.genre == 10749
                movies.genre = "Romance"
            when movies.genre == 18
                movies.genre = "Drama"
            when movies.genre == 12
                movies.genre = "Adventure"
            when movies.genre == 27
                movies.genre = "Horror"
            when movies.genre == 878
                movies.genre = "Sci-Fi"
            when movies.genre == 80
                movies.genre = "Crime"
            when movies.genre == 14
                movies.genre = "Fantasy"
            when movies.genre == 37
                movies.genre = "Western"
            when movies.genre == 10751
                movies.genre = "Family"
            when movies.genre == 9648
                movies.genre = "Mystery"
            when movies.genre == 16
                movies.genre = "Animation"
            when movies.genre == 10752
                movies.genre = "War"
            when movies.genre == 36
                movies.genre = "History"
            when movies.genre == 10402
                movies.genre = "Music"
            else
                puts "Error. Genre not recognized"
            end
        end
    end

    def detail #data from api has lots of infomration. This returns and organizes all the info for a detialed view.
        clean_data=MovieData.new.get_movies_pages
        movie_detail=clean_data.find do |hsh|
            hsh["original_title"]==self.title
            end
        overview=movie_detail["overview"]
        title=movie_detail["title"]
        vote_average=movie_detail["vote_average"]
        genre=self.genre
        total_votes=movie_detail["vote_count"]
        puts "============================================================"
        puts "Title: #{title}"
        puts ''
        puts "Genre: #{genre}"
        puts ''
        puts "Vote Average: #{vote_average}"
        puts ''
        puts "Total Votes: #{total_votes}"
        puts ''
        puts "Overview:e"
        puts "#{overview}"
    end

#--------------
#Inception.genre => genre object

    def self.create_genre_by_movie #this creates all of the genre instances. 
       array_genre=[]
        @@all.each do |movie|
            array_genre << movie.genre
        end
        clean_array=array_genre.uniq
        clean_array.each do |genre|    
        i=Genre.new(genre)
        end
    end

    def self.clean_movie_titles #used for ranked by popularity. pulls just the title for the movie and prints out title in a user friendly way.
        n=0
        array=Movies.all.collect do |movie|
            movie.title
        end
        while n < 100
            puts "____________________________________________________________"
            # puts"#{n+1}. #{array[n]}                 #{n+2}. #{array[n+1]}"
            puts"#{n+1}. #{array[n]}"
            puts "````````````````````````````````````````````````````````````"

            n += 1
        end
    end

    def self.sorted_clean_movie_titles #Used for ranked by rating. pulls just the title for the movie and prints out title in a user friendly way. 
        n=0
        array=Movies.sort_by_rating.collect do |movie|
            movie.title
        end
        while n < 100
            puts "____________________________________________________________"
            # puts"#{n+1}. #{array[n]}                 #{n+2}. #{array[n+1]}"
            puts"#{n+1}. #{array[n]}"
            puts "------------------------------------------------------------"

            n += 1
        end
    end
end


