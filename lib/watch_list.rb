class WatchList
@@movies = []
    
    
    def self.add_to_list(movie) #adds movies to watch list
        @@movies << movie
    end

    def self.movies #pulls array of all moveis on watch list
        @@movies
    end

    def self.clear_list #clears watch list
        @@movies.clear
    end

    def self.view_list #view what movies are in watch list
        if @@movies.count == 0
            puts "list is empty"
        else
        puts "Current List"
        @@movies.each do |movie|
            puts "- #{movie}"
            end
        end
    end

end

    # def self.select_movie #allows user to select movie and get more detail from the movies on the watch list
    #     input = gets.chomp.downcase
    #     num = input.to_i
    #     num -= 1
    #     chosen_movie = @@movies[num]
    #     if chosen_movie == nil
    #         if input == "00"
    #             self.main_menu

    #         elsif input=="exit"
    #                 puts "Come back soon!"
    #                 exit!
    #         elsif input=="clear"
    #             WatchList.clear_list
    #             self.main_menu
    #         else 
    #             puts "invalid input. Try again"
    #             self.wrap_up_watch_list
    #         end
    #     else
    #     chosen_movie.detail
    #     end
    # end

#     def self.remove_from_list #removies just the movie they want to off the list
#         n=0
#         list_length=@@movies.count
#         while n < list_length
#             puts "#{n+1}. #{@@movies[n]}"
#             n+=1
#         end
#         input = gets.chomp.to_i
#         input -= 1
#         @@movies.delete_at(input)
#         puts "Updated list"
#         x=0
#         while x < @@movies.count
#             puts "- #{@@movies[x]}"
#             x+=1
#         end

#     end
# end