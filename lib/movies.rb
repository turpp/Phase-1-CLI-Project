#movie belongs to genre
#movie has a title
#movie has rating
#movie has a genre




class Movies
attr_accessor :title
attr_reader :rating, :genre
@@all = []
    def initialize(title)
        @title = title
        @@all << self
        
    end

    def self.all
        @@all
    end

    def genre
        #get all the genres out there
        #go through each genre looking for title of movie
        #once found title return the genre

        all_genres=Genre.all
        all_genres.find do |genre|
            genre.movies.include?(self) == true
        end
    end




end



# inception = Movie.new(Inception) => returns a new instance Inception and adds it to the @@all array
#Inception.genre => the genre of inception
#Inception.rating => 
