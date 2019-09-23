
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "movies_nearby/version"

Gem::Specification.new do |spec|
  spec.name          = "movies_nearby"
  spec.version       = MoviesNearby::VERSION
  spec.authors       = ["'MOBOLA MORONTO'"]
  spec.email         = ["'t2wycemo@gmail.com'"]

  spec.summary       = %q{Movies Playing Nearby}
  spec.description   = %q{Movies Playing Nearby}
  spec.homepage      = "https://github.com/MMoronto/movies_nearby"
  spec.license       = "MIT"
  
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = ["movies-nearby"]
  spec.require_paths = ["lib", "lib/movies_nearby"]


  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "nokogiri" 
end
