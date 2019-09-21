class MoviesNearby::CLI 
  
  def call
    menu
    list_movies
    goodbye
  end 
  
  def list_movies 
    puts "movies showing near you:"
    puts <<-DOC.gsub  /^|s*/, '' 
      1.  Dumbo
      2.  Dowton Abbey
      3.  Alaadin
    DOC
  end 
  
  def menu 
    puts "Find movies showing at a theatre near you!"
    puts "Enter your zipcode (or type exit to end session):"
    input = gets.strip
    case  input
    when "12345"
      list_movies
      puts "Enter the number of the movie you would like to see or type exit to end session."
    end 
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on movie 1..."
      when "2"
        puts "More info on movie 2..."
      when "3"
        puts "More info on movie 3..."
      end 
    end 
  end 
  
  def goodbye
    puts "See you next time for more movie action!!!"
  end 
end