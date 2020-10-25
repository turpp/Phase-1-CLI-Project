#-------------file overview----------------
#this is my program file. 
# this handels all user interface.
# this file is designed to run listing to user inputs and only stop when user say to stop
#this will pull methods from other files to get the infomation the user wants.
# methods on this page are grouped by Menu, selection process, ending inputs
require_relative('../config/environment.rb')

class User

    def greeting #start up of the program
        puts ""
        puts ''
        puts "---------------------------------"
        puts "Welcome to Movie Selector 9000!"
        puts "---------------------------------"
        puts  "Instructions: To progress through the application, please type the number for your selection and press enter. If at anytime you wish to close the program, type exit and press enter."
        puts " "
        puts " "
        puts " "
        self.main_menu
    end

    #------------Menus-----------------------
    def main_menu #main menu. how the user begins progessing through the program
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "How would you like to view the movies?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "1. Ranked by Popularity"
        puts "2. Grouped by Genre"
        puts "3. Movies by Rating"
        puts "4. View Watch List"
        puts "`````````````````````````````````````````````````````````````"
        input=gets.chomp.downcase
        if input == "1"
            self.all_movie_menu
            self.movies_selected
        elsif input == "2"
            self.genre_movies
        elsif input == "exit"
            puts "Come Back Soon!"
            exit!
        elsif input == "3"
            self.sorted_all_movie_menu
            self.sorted_movies_selected
            elsif input == "4"
                WatchList.view_list
                self.wrap_up_watch_list
        else
            puts "Invalid input. Try again!"
            main_menu
        end
    end

    def all_movie_menu #menu for ranked by popularity. it prints out all movies in a user friendly way
        x=Movies.clean_movie_titles
            puts "#{x}"
            puts "00. Main Menu"
     end

     def all_genre_menu #menu for genres. its shows what all genres are availbile to view in a user friendly way
        y=Genre.clean_genre
            puts "#{y}"
            puts "00. Main Menu"
     end

     def sorted_all_movie_menu #menu for all movies that are ranked by rating. 
        x=Movies.sorted_clean_movie_titles
            puts "#{x}"
            puts "00. Main Menu"
     end
    #------------selections-------------------
    def movies_selected #takes user input and selects movie to view more detail on that selected movie
        puts "Select movie"
        inputs = gets.chomp.downcase
        if inputs=="exit"
            puts "Come Back Soon!"
            exit!
        elsif inputs=="00"
            self.main_menu
        else
        user_number = inputs.to_i
            if user_number > 100
                puts "Invalid input. Try again"
                self.movies_selected
            elsif user_number < 0
                    puts "Invalid input. Try again"
                    self.movies_selected
            elsif user_number == 0
                puts "Invalid input. Try agin"
                self.movies_selected
            else
            user_number -= 1
            @selected_movie = Movies.all[user_number]
            @selected_movie.detail
            puts ""
            puts "____________________________"
            puts "1. Back to Movie Selection"
            puts "2. Back to Main Menu"
            puts "3. Add to Watch List"
            puts "Exit Program"
            self.wrap_up_movie
            end
        end
    end

    def genre_movies #allows the suer to select what genre they want to explore from the genre menu
        self.all_genre_menu
        n=0
        puts "Enter the number for the Genre you would like to view"
        genre_input = gets.chomp.downcase
        if genre_input == "exit"
            puts "Come Back Soon!"
            exit!
        elsif genre_input =="00"
            self.main_menu
        else
            user_number = genre_input.to_i

            if user_number > 12
                puts "Invalid input. Try again"
                self.genre_movies
            elsif user_number < 0
                puts "Invalid input. Try again"
                self.genre_movies
            elsif user_number == 0
                puts "Invalid input. Try again"
                self.genre_movies      
            else
        user_number -= 1
        selected_genre=Genre.all[user_number]
        @@movies_in_genre=selected_genre.get_movies
        @@titles=@@movies_in_genre.collect do |movie|
            movie.title
                end
            end
        end
        until n == @@titles.count
        puts "____________________________________________________________"
        puts "#{n+1}. #{@@titles[n]}"
        puts "============================================================"
        n+=1
        end
        self.genre_selction
    end

    def genre_selction #allows the user to select a movie in said genre and get detail on just that movies
        puts "Select the movie for more information or enter 00 for the Genre Menu"
        input=gets.chomp.downcase
        if input =="exit"
            puts "Come Back Soon!"
            exit!
        elsif input == "00"
            self.genre_movies
        else
        user_number = input.to_i
            if user_number == 0
             puts "Invalid input. Try again"
             self.genre_selction
            elsif user_number > @@titles.count
                puts "Invalid input. Try again"
                self.genre_selction
            elsif user_number < 0
                puts "Invlaid input. Try again"
                self.genre_selction
            else
                user_number -= 1
                @selected_movie = @@movies_in_genre[user_number]
                @selected_movie.detail
                puts " "
                puts "_________________________________"
                puts "1. Back to Genre Menu"
                puts "2. Back to Main Menu"
                puts "3. Add to Watch List"
                puts "Exit Program"
                self.wrap_up_genre
            end
        end
     end

     def sorted_movies_selected #selection of movie in the Ranked by rating  menu
        puts "Select Movie"
        inputs = gets.chomp.downcase
        if inputs=="exit"
            puts "Come Back Soon!"
            exit!
        elsif inputs=="00"
            self.main_menu
        else
        user_number = inputs.to_i
            if user_number > 100
                puts "Invalid input. Try again"
                self.movies_selected
            elsif user_number < 0
                    puts "Invalid input. Try again"
                    self.movies_selected
            elsif user_number == 0
                puts "Invalid input. Try agin"
                self.movies_selected
            else
            user_number -= 1
            @the_selected_movie = Movies.sort_by_rating[user_number]
            @the_selected_movie.detail
            puts ""
            puts "____________________________"
            puts "1. Back to Movie Selection"
            puts "2. Back to Main Menu"
            puts "3. Add to Watch List"
            puts "Exit Program"
            self.wrap_up_sorted_movie
            end
        end
    end
    #------------ending wrap ups---------------
     def wrap_up_movie #the ending input on the movie by popularity
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.all_movie_menu
            self.movies_selected
        when last_input=="2"
            self.main_menu
        when last_input=="exit"
            puts "Come Back Soon!"
            exit!
        when last_input=="3"
            WatchList.add_to_list(@selected_movie.title)
            self.main_menu
        else
            puts "Invalid input. Try again"
            self.wrap_up_movie
        end
     end

     def wrap_up_genre #the ending input on the movie by genre
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.genre_movies
        when last_input=="2"
            self.main_menu
        when last_input=="exit"
            puts"Come Back Soon!"
            exit!
        when last_input == "3"
            WatchList.add_to_list(@selected_movie.title)
            self.main_menu
        else
            puts "Invalid input. Try again"
            self.wrap_up_genre
        end
     end

    def wrap_up_sorted_movie #the ending input on the movie by rating
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.sorted_all_movie_menu
            self.sorted_movies_selected
        when last_input=="2"
            self.main_menu
        when last_input =="3"
            WatchList.add_to_list(@the_selected_movie.title)
            self.main_menu

        when last_input=="exit"
            puts "Come Back Soon!"
            exit!
        else
            puts "Invalid input. Try again"
            self.wrap_up_sorted_movie
        end
     end

    def wrap_up_watch_list #the ending input on the watch list
        # puts "Select Movie for more info"
        puts''
        puts'_________________________________'
        puts "00. Main Menu"
        # puts "Select Movie for More Detail"
        puts "Type CLEAR to Empty List"
        last_input=gets.chomp.downcase
        
        if last_input == "00"
            self.main_menu

        elsif last_input=="exit"
                puts "Come Back Soon!"
                exit!
        elsif last_input=="clear"
            WatchList.clear_list
            # self.clear
            self.main_menu
        else 
            puts "Invalid input. Try again"
            self.wrap_up_watch_list
        end
    
        def watch_list_menu
            WatchList.view_list
            self.wrap_up_watch_list   
        end
    end




#------------------possible refactoring----------
#input method. it takes in input and downcase and checks for exit, 00 main menu.
# method that puts out the ending wrap ups





def clear
    system 'clear'
end

end



#additions----------
#put in my clear method to clean up program when you go back to the main menu---- when you click main menu... also when you get movie detial
#can get more detial from watch list
#can delete certain things on watch list
# when add to watch list remains on the page???
