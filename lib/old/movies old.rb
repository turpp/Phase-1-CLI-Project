#movie belongs to genre
#movie has a title
#movie has a single rating
#movie has a genre




class Movies
attr_accessor :title, :genre
attr_reader :rating
@@all = []
    def initialize(title,genre)
        @title = title
        @genre=genre
        @@all << self
    end

    def self.all
        @@all
    end

    

    def self.ids_to_objects
        all_movies=Movies.all
        binding.pry
        all_movies.each do |movie|
            movie.genre=(Genre.all.find{|genre| genre.name == movie.genre})
            # if movie.genre == 
            #     #  binding.pry
            #     movie.genre=(Genre.all.find{|genre| genre.name == "Action"})
            # else 
            #     puts "tripp rocks"
            # end
        end
    end

    # def genre_data
    #     movie=MovieData.new
    #     title_genre=movie.movie_title_genre
    #     title_genre.each do |hsh|

    # def genre
    #     #get all the genres out there
    #     #go through each genre looking for title of movie
    #     #once found title return the genre

    #     all_genres=Genre.all
    #     all_genres.find do |genre|
    #         genre.movies.include?(self) == true
    #     end
    # end

#I want to intialize a bunch of movies from my movie data
# I need to go through the data and pull the title from each hash.
# with each name pulled I need to create a new movie instance

    # def self.movie_from_data
    #     movie_data = MovieData.new
    #     all_titles = movie_data.movie_titles
    #     all_titles.each do |titles|
    #         Movies.new(titles)
    #     end
    # end


    def self.movie_from_data
        movie_data = MovieData.new
        all_titles = movie_data.movie_title_genre
    #_______
    # id_objects= all_titles.each do |hsh|

    #     Genre.all.find do |genre|
    #         # binding.pry
    #         hsh[:genre_ids] == genre
    #     end
    # end

    


        all_titles.each do |hsh|
            # binding.pry
            Movies.new(hsh[:original_title],hsh[:genre_ids])
            #____________________
            # Movies.new(hsh[:original_title],id_objects)
            
    end
        
end
def self.convert_ids
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





end



# inception = Movie.new(Inception) => returns a new instance Inception and adds it to the @@all array
#Inception.genre => the genre of inception
#Inception.rating => 
