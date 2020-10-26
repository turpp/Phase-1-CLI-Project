#-----------file outline---------
# is responsable for geting information from the api
# gives infomation ready for the other files to read
# holds all the master data




class MovieData
    
    def get_movies_pages #gets data from API
        array=[]
        n=1
    while n < 11
        url= "https://api.themoviedb.org/3/discover/movie?api_key=356630208dd743ca0f8ab6dcc24b36c6&language=en-US&region=us&sort_by=vote_count.desc&include_adult=true&include_video=false&page=#{n}&with_genres=28%7C35%7C53%7C10749%7C18%7C12%7C27%7C878"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        data=response.body
        rough_data= JSON.parse(data)
        clean_data=rough_data["results"]
        n += 1
        array << clean_data
    end
    array.flatten
end

    # def movie_titles #gets just the titles from the api data
    #     clean_data = self.get_movies_pages
    #     clean_data.collect do |movies|
    #     movies["original_title"]
    #     end
    # end

    # def movie_genres #gets just the genres ids from api data
    #     clean_data = self.get_movies_pages
    #     big_array=clean_data.collect do |movies|
    #     movies["genre_ids"].uniq
    #     # movies["genre_ids"].collect do |id_array|
    #     #     id_array.uniq
    #     end
    #     big_array.flatten.uniq   
    # end
    
    # def rating_asc #sorts api data by rating in ascending order
    #     clean_data = self.get_movies_pages
    #     rated=clean_data.sort_by { |hsh| hsh["vote_average"] }
    #     rated
    # end

    # def rating_desc #sorts api data by rating in descenting order.
    #     clean_data = self.get_movies_pages
    #     rated=clean_data.sort_by { |hsh| hsh["vote_average"] }.reverse
    #     rated
    # end

    def movie_title_genre #organizes api data in a way to create new Movie instances. 
        # clean_data = self.get_movies_pages
        $clean_data.map do |hash|

            { "original_title": hash["original_title"], "genre_ids": hash["genre_ids"][0], "vote_average": hash["vote_average"]}
          end
    end
      
    

end
    