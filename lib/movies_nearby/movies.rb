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
    doc = Nokogiri::HTML(open("https://www.fandango.com/19063_movietimes"))
    binding.pry 
    
    movie = self.new 
    
    movie.name =doc.search("h3.fd-movie__title font-sans-serif font-lg font-300 uppercase").text.strip
    movie.url = doc.search('a.icon icon-follow-gray fd-movie__follow-icon js-hearts-heart').attr("href").value 
    movie.summary = doc.search("p.mop__synopsis-content").text.strip
    movie.stars = doc.search("div.carousel-cast-crew").collect{|e| e.text.strip}.join(",")
    
    movie 
  end 
end 