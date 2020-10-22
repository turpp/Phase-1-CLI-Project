#genre has man movies
#genre has a name
#will be able to get a list of movies by name of genre


#????will need to pull genre from movie data.... genre is coded in ids. will need to convert ids to named geners



class Genre
attr_accessor :name
attr_reader :title, :movies
@@all=[]
    def initialize(name)
        @movies = []
        @name=name
        @@all << self
    end

    def movies
        @movies
    end

    def add_movie_to_genre(movie)
        @movies << movie
    end

    def self.all
        @@all
    end


end



# ------------------
# comedy = Genre.new(comedy)=> new instance comedy. that has a blank array of movies
# comedy.movies => array of movies assocated with comedy
# Genre.all => array off all the genres
# comedy.add_movie_to_genre(Inception) => comedy movie array now holds Inception movie. 
# comedy.movies => [Inception]

