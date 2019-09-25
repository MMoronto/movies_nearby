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
    doc = Nokogiri::HTML(open("https://fandango.com"))
    binding.pry 
    
    movie = self.new 
    
    movie.name =doc.search("span.heading-style-1 browse-movielist--title poster-card--title").text.strip
    movie.url = doc.search('https://www.fandango.com/abominable-2019-218991/movie-overview').attr("href").value 
    movie.summary = doc.search("p.mop__synopsis-content").text.strip
    movie.stars = doc.search("div.carousel-cast-crew").collect{|e| e.text.strip}.join(",")
    
    movie 
  end 
end 