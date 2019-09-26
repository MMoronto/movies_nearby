class MoviesNearby::Movies 
  attr_accessor :name, :url, :summary, :stars

 
  def self.nearby 
    # Scrape fandango then return movie details based on data
    self.scrape_movies
  end 
  
  def self.scrape_movies 
    movies = []
    
    movies << self.scrape_fandango
    
    movies
  end 
  
  def self.scrape_fandango
    doc = Nokogiri::HTML(open("https://www.fandango.com"))
   
    
    movie = self.new 
    
    movie.name = doc.search("span.heading-style-1.browse-movielist--title poster-card--title").text.strip
     binding.pry 
     
    movie.url = doc.search('a.subnav__link').attr("href").value 
    movie.summary = doc.search("p.movie-synopsis__body").text.strip
    movie.stars = doc.search("div.carousel-cast-crew").collect{|e| e.text.strip}.join(",")
    
    movie 
  end 
end 