class MoviesNearby::Movies 
  attr_accessor :name, :url, :summary, :stars

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
  end

end 