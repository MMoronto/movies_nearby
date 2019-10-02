class MoviesNearby::Movies 
  attr_accessor :name, :location, :closed, :url

  def self.nearby 
    # Scrape fandango and return theaters nearby based on that data 
    self.scrape_movies
  end
  
  def self.scrape_movies 
    movies = []
    
    movies << self.scrape_fandango
    
    movies 
  end 
  
  
  def self.scrape_fandango
    doc = Nokogiri::HTML(open("https://fandango.com"))
    binding.pry 
    
    movie = self.new 
    movie.name = doc.search("h3.fd-theater__name").text.strip
    movie.location = doc.search("div.fd-theater__address-wrap").text.strip
    movie.closed = !true 
    movie.url = doc.search("a.light").first.attr("href").strip
    
    movie 
  end
end 