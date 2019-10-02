class MoviesNearby::CLI 
  
  def call
    list_movies
    menu
    goodbye
  end 
  
  def list_movies 
    puts "Movie Theaters near you:"
    @movies = MoviesNearby::Movies.nearby
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie.name} - #{movie.location} - #{movie.closed}" 
    end 
  end 
  
  def menu 
    input = nil 
    while input != "exit"
      puts "Enter the number of the movie theater you would like more info on or type list to see the list again or type exit:"
      input = gets.strip.downcase
    
      if input.to_i > 0 
        the_movie = @movies[input.to_i-1]
        puts "#{the_movie.name} - #{the_movie.location} - #{the_movie.closed}"
      elsif input == "list"
        list_movies
      else 
        puts "Not sure what you want, type list or exit."
      end
    end
  end   

  def goodbye
    puts "See you next time for more movie theater listings!!!"
  end 
end