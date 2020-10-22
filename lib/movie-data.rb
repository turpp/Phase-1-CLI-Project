require 'pry'
require 'json'
require 'net/http'
require 'open-uri'


class MovieData
    
# URL = "https://api.themoviedb.org/3/discover/movie?api_key=356630208dd743ca0f8ab6dcc24b36c6&language=en-US&region=us&sort_by=vote_count.desc&include_adult=true&include_video=false&page=1&with_genres=28%7C35%7C53%7C10749%7C18%7C12%7C27%7C878"

#     def get_movies
#     uri = URI.parse(URL)
#     response = Net::HTTP.get_response(uri)
#     data=response.body
#     rough_data= JSON.parse(data)
#     clean_data=rough_data["results"]
#     end 




#     def movie_titles
#         clean_data = self.get_movies
#         clean_data.collect do |movies|
#             movies["original_title"]
#         end
#     end
# binding.pry
# end



# --------------------------------
    def get_movies_pages
        array=[]
        n=1
    while n < 6
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

    def movie_titles
        clean_data = self.get_movies_pages
        clean_data.collect do |movies|
        movies["original_title"]
        end
    end
    
    def rating_asc
        clean_data = self.get_movies_pages
        rated=clean_data.sort_by { |hsh| hsh["vote_average"] }
        rated
    end

    def rating_desc
        clean_data = self.get_movies_pages
        rated=clean_data.sort_by { |hsh| hsh["vote_average"] }.reverse
        rated
    end

end
    