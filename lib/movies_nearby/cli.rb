class MoviesNearby::CLI 
  
  def call
    menu
    list_movies
    goodbye
  end 
  
  def list_movies 
    puts "movies showing near you:"
    puts <<-DOC.gsub  /^|s*/, '' 
      1.  AMC Marple 10
      2.  Regal Edgmont Square
      3.  AMC Dine-in Painters Crossing 9
    DOC
  end 
  
  def menu 
    puts "Find a movie theatre near Media PA!"
    puts "Enter nearby (or type exit to end session):"
    input = gets.strip
    case  input
    when "nearby"
      list_movies
      puts "Enter the number of the movie theater you would like to visit or type exit to end session."
    end 
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on movie theater 1..."
      when "2"
        puts "More info on movie theater 2..."
      when "3"
        puts "More info on movie theater 3..."
      end 
    end 
  end 
  
  def goodbye
    puts "See you next time for more movie theater listings!!!"
  end 
end