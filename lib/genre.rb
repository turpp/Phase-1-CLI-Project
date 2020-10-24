#----------file outline---------
# genre has many movies%%%%%%%%%%%%%%%%%%%%%%%%
# will give me a list of movies in each genre%%%%%%%%%%%%%%%%%%
# will have a master list of genres%%%%%%%%%%%%%%%%%%%%
# will get data from MovieData and create instances%%%%%%%%%%%%%5
#----------------------------------
class Genre
attr_accessor :name
attr_reader :movies
@@all=[]
    def initialize(name)
        @movies=[]
        @name=name
        @@all << self
    end

    def get_movies #notifies Genre what movies belong to it.
        all_movies=Movies.all
        all_movies.find_all do |movie|
            if movie.genre.include?(self.name) == true
                @movies << movie
            end 
        end
    end

    def self.all #shoes all genres from the api collection
        @@all
    end

    def self.clean_genre #prints out all genres in a user friendly way
        n=0
        array=Genre.all.collect do |genre|
            genre.name
            end
        while n < 12
            puts "____________________________________________________________"
            puts"#{n+1}. #{array[n]}"
            puts "------------------------------------------------------------"
            n += 1
        end

    end
end




