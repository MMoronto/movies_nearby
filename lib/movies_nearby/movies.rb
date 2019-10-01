class MoviesNearby::Movies 
  attr_accessor :name, :url, :summary, :stars

  def initialize(name = nil, url = nil)
    @name = name
    @url = url 
  end
  
  def self.all 
    @@all ||= scrape_fandango
  end 
  
  def self.find(id)
    self.all[id-1]
  end 
  
  def self.find_by_name(name) 
    self.all.detect do |m| 
      m.name.downcase.strip == name.downcase.strip ||
      m.name.split("(").first.strip.downcase == name.downcase.strip
    end 
  end 
  
  def summary
    @summary ||= plot_summary_doc.search("p.mop__synopsis-content").text.strip
  end

  def stars
    @stars ||= doc.search("dl.cast-and-crew__credits[itemprop='name']").collect{|e| e.text.strip}.join(", ")
  end
  
  def plot_summary_doc
      @plot_summary_doc ||= Nokogiri::HTML(open("#{self.url}plot-summary"))
    end

  
  def self.scrape_fandango
    doc = Nokogiri::HTML(open("https://www.fandango.com/movies-in-thearters"))
    
    binding.pry 
    
    names = doc.search("span[itemprop='heading-style-1'] a[itemprop='url']")
    names.collect{|e| new(e.text.strip, "https://www.fandango.com#{e.attr("href").split("?").first.strip}")}
  end
  
  def doc
      @doc ||= Nokogiri::HTML(open(self.url))
  end
end 