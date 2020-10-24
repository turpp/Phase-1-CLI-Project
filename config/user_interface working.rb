#-------------file overview----------------
#this files is to get the user interface comands. %%%%%%%%%%%%%%
# it will allow me to call the action in the run folder. the actions here will pull all the info I need from the other files%%%%%%%%%%
# this will make the actions easy to read and user friendly %%%%%%%%%%%%%
require_relative('../config/environment.rb')

class User

    def greeting
        puts ""
        puts ''
        puts "-------------------------------"
        puts "Welcome to Movie Selector 9000!"
        puts "-------------------------------"
        puts  "Instructions: To progress through the application. Please type number and press enter. At anytime you wish to close program, type exit and enter."
        puts " "
        puts " "
        puts " "
        self.main_menu
    end
    def main_menu
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "How would you like to view the movies?"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "1. Most Popular Movies"
        puts "2. Genre"
        puts "3. Movies by Rating"
        puts"```````````````````````````````````````````````````````````````"
        input=gets.chomp.downcase
        if input == "1"
            self.all_movie_menu
            self.movies_selected
        elsif input == "2"
            self.genre_movies
        elsif input == "exit"
            puts "Come back soon!"
            exit!
        elsif input == "3"
            self.sorted_all_movie_menu
            self.sorted_movies_selected
            #movies_selected?
        else
            puts "invalid input. Try again!"
            main_menu
        end
    end

     def all_movie_menu
        x=Movies.clean_movie_titles
            puts "#{x}"
            puts "00. Main Menu"
     end

     def all_genre_menu
        y=Genre.clean_genre
            puts "#{y}"
            puts "00. Main Menu"
     end

     def movies_selected
        puts "Select movie"
        inputs = gets.chomp.downcase
        if inputs=="exit"
            puts "Come back soon!"
            exit!
        elsif inputs=="00"
            self.main_menu
        else
        user_number = inputs.to_i
            if user_number > 100
                puts "invalid input. Try again"
                self.movies_selected
            elsif user_number < 0
                    puts "invalid input. Try again"
                    self.movies_selected
            elsif user_number == 0
                puts "invalid input. Try agin"
                self.movies_selected
            else
            user_number -= 1
            selected_movie = Movies.all[user_number]
            selected_movie.detail
            puts ""
            puts "____________________________"
            puts "1. Back to movie selection"
            puts "2. Back to main menu"
            puts "Exit program"
            self.wrap_up_movie
            end
        end
    end

     def wrap_up_movie
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.all_movie_menu
            self.movies_selected
        when last_input=="2"
            self.main_menu
        when last_input=="exit"
            puts "Come back soon!"
            exit!
        else
            puts "invalid input. Try again"
            self.wrap_up_movie
        end
     end

     def wrap_up_genre
        
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.genre_movies
        when last_input=="2"
            self.main_menu
        when last_input=="exit"
            puts"Come back soon!"
            exit!
        else
            puts "invalid input. Try again"
            self.wrap_up_genre
        end
     end

     def genre_movies
        self.all_genre_menu
        n=0
        puts "Enter number for Genre you would like to view"
        genre_input = gets.chomp.downcase
        if genre_input == "exit"
            puts "Come back soon!"
            exit!
        elsif genre_input =="00"
            self.main_menu
        else
            user_number = genre_input.to_i

            if user_number > 12
                puts "invalid input. Try again"
                self.genre_movies
            elsif user_number < 0
                puts "invalid input. Try again"
                self.genre_movies
            elsif user_number == 0
                puts "invalid input. Try again"
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
            puts "______________________________"
        puts "#{n+1}. #{@@titles[n]}"
        puts "===================================="

        n+=1
        
        end
        self.genre_selction
    end

    def genre_selction
        puts "Select Movie for more information or enter 00 for genre menu"
        input=gets.chomp.downcase
        if input =="exit"
            puts "Come back soon!"
            exit!
        elsif input == "00"
            self.genre_movies
        else
        user_number = input.to_i
            if user_number == 0
             puts "invalid input. Try again"
             self.genre_selction
            elsif user_number > @@titles.count
                puts "invalid input. Try again"
                self.genre_selction
            elsif user_number < 0
                puts "invlaid input. Try again"
                self.genre_selction
            else
                user_number -= 1
                selected_movie = @@movies_in_genre[user_number]
                selected_movie.detail
                puts " "
                puts "_________________________________"
                puts "1. Back to genre selection"
                puts "2. Back to main menu"
                puts "Exit program"
                self.wrap_up_genre
            end
        end

     end

     


   

    #---------extras made below------------
    

    def sorted_all_movie_menu
        x=Movies.sorted_clean_movie_titles
            puts "#{x}"
            puts "00. Main Menu"
     end


     def sorted_movies_selected
        puts "Select movie"
        inputs = gets.chomp.downcase
        if inputs=="exit"
            puts "Come back soon!"
            exit!
        elsif inputs=="00"
            self.main_menu
        else
        user_number = inputs.to_i
            if user_number > 100
                puts "invalid input. Try again"
                self.movies_selected
            elsif user_number < 0
                    puts "invalid input. Try again"
                    self.movies_selected
            elsif user_number == 0
                puts "invalid input. Try agin"
                self.movies_selected
            else
            user_number -= 1
            selected_movie = Movies.sort_by_rating[user_number]
            selected_movie.detail
            puts ""
            puts "____________________________"
            puts "1. Back to movie selection"
            puts "2. Back to main menu"
            puts "Exit program"
            self.wrap_up_sorted_movie
            end
        end
    end

    def wrap_up_sorted_movie
        last_input=gets.chomp.downcase
        case 
        when last_input == "1"
            self.sorted_all_movie_menu
            self.movies_selected
        when last_input=="2"
            self.main_menu
        when last_input=="exit"
            puts "Come back soon!"
            exit!
        else
            puts "invalid input. Try again"
            self.wrap_up_sorted_movie
        end
     end









end