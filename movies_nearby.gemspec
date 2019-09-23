
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "movies_nearby/version"

Gem::Specification.new do |spec|
  spec.name          = "movies_nearby"
  spec.version       = MoviesNearby::VERSION
  spec.authors       = ["'MOBOLA MORONTO'"]
  spec.email         = ["'t2wycemo@gmail.com'"]

  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/MMoronto/movies_nearby"
  spec.license       = "MIT"


  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri" 
end
