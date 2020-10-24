#genre has man movies
#genre has a name
#will be able to get a list of movies by name of genre


#????will need to pull genre from movie data.... genre is coded in ids. will need to convert ids to named geners


#I need to fill the @movies array for each genre instance
#go thourgh the movie_data.movie_genre => and array of hashes with title and ids
#looks for a match in genre ids and Genre.all and if matches at title add title to @movies of that instance








class Genre
attr_accessor :name
attr_reader :movies
@@all=[]
    def initialize(name)
        @name=name
        @@all << self
    end

    # def movies
    #     @movies
    # end

    # def add_movie_to_genre(movie)
    #     @movies << movie
    # end
#------------below doesnt work------------
    def movies
        #get all the genres out there
        #go through each genre looking for title of movie
        #once found title return the genre
        




        all_movies=Movies.all
        all_movies.collect do |movie|
            movies.genre.include?(self.name) == true
        end
    end
#----------------------

        








    def self.all
        @@all
    end

    def self.convert_ids
        @@all.each do |id|
            id.name
        end
    end

    def name
        case
        when @name == 28
            @name = "Action"
        when @name == 35
            @name="Comedy"
        when @name == 53
            @name ="Thriller"
        when @name == 10749
            @name = "Romance"
        when @name == 18
            @name = "Drama"
        when @name == 12
            @name = "Adventure"
        when @name == 27
            @name = "Horror"
        when @name == 878
            @name = "Sci-Fi"
        when @name == 80
            @name = "Crime"
        when @name == 14
            @name = "Fantasy"
        when @name == 37
            @name = "Western"
        when @name == 10751
            @name = "Family"
        when @name == 9648
            @name = "Mystery"
        when @name == 16
            @name = "Animation"
        when @name == 10752
            @name = "War"
        when @name == 36
            @name = "History"
        when @name == 10402
            @name = "Music"
        else
            puts "Error. Genre not recognized"
        end
    end


    def self.genre_from_data
        movie_data = MovieData.new
        all_genre = movie_data.movie_genres
        all_genre.each do |genre|
            Genre.new(genre)
        end
    end


#     def self.connect_movie
#         movie_data = MovieData.new
#        title_genre_hsh = movie_data.movie_title_genre
#        title_genre_hsh.each do |hash|
#         hash.each do |key,value|

#         if value.kind_of?(Array)
           
#             value.each do |ids|

#             case
#             when ids == 28
#                 # binding.pry
#                 # want to add title to the instance of 28
#                 # @@all["28"].add_movie_to_genre(hash[:orginal_title])
#                 @@all.each do |ids|
#                     if ids.name == "Action"
#                         ids.add_movie_to_genre(hash[:original_title])
#                     end
#                 end
#             when ids == 35
#                 @@all.each do |ids|
#                     if ids.name == "Comedy"
#                         ids.add_movie_to_genre(hash[:original_title])
#                     end
#                 end
#             when ids == 53
#                 @@all.each do |ids|

#                 if ids.name == "Thriller"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end   
#             end     
#             when ids == 10749
#                 @@all.each do |ids|

#                 if ids.name == "Romance"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end   
#             end      
#             when ids == 18
#                 @@all.each do |ids|

#                 if ids.name == "Drama"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end       
#             end
#             when ids == 12
#                 @@all.each do |ids|

#                 if ids.name == "Adventure"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end     
#             end     
#             when ids == 27
#                 @@all.each do |ids|

#                 if ids.name == "Horror"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end   
#             end
#             when ids == 878
#                 @@all.each do |ids|

#                 if ids.name == "Sci-Fi"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end 
#             end         
#             when ids == 80
#                 @@all.each do |ids|

#                 if ids.name == "Crime"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end 
#             end    
#             when ids == 14
#                 @@all.each do |ids|

#                 if ids.name == "Fantasy"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end 
#             end          
#             when ids == 37
#                 @@all.each do |ids|

#                 if ids.name == "Western"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end  
#             end      
#             when ids == 10751
#                 @@all.each do |ids|

#                 if ids.name == "Family"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end  
#             end          
#             when ids == 9648
#                 @@all.each do |ids|

#                 if ids.name == "Mystery"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end 
#             end           
#             when ids == 16
#                 @@all.each do |ids|

#                 if ids.name == "Animation"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end  
#             end          
#             when ids == 10752
#                 @@all.each do |ids|

#                 if ids.name == "War"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end  
#             end          
#             when ids == 36
#                 @@all.each do |ids|

#                 if ids.name == "History"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end    
#             end        
#             when ids == 10402
#                 @@all.each do |ids|

#                 if ids.name == "Music"
#                     ids.add_movie_to_genre(hash[:original_title])
#                 end  
#             end          
#             else
#                 puts "tbd"
#             end
#         end
#     end
# end
# end
            
        
    
#     end
    


end



# ------------------
# comedy = Genre.new(comedy)=> new instance comedy. that has a blank array of movies
# comedy.movies => array of movies assocated with comedy
# Genre.all => array off all the genres
# comedy.add_movie_to_genre(Inception) => comedy movie array now holds Inception movie. 
# comedy.movies => [Inception]

