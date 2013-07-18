$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "can_be_tagged/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "can_be_tagged"
  s.version     = CanBeTagged::VERSION
  s.authors     = "Enzo Cappa"
  s.email       = "zcappa@gmail.com"
  s.homepage    = "https://github.com/zherk/can_be_tagged"
  s.summary     = "Tagging plugin for rails"
  s.description = "A simple tagging plugin for rails, with basic functionalities and RoR 4 ready"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "rails", "~> 4.0.0"
  s.add_development_dependency "sqlite3"
  #s.add_development_dependency "activerecord-sqlite3-adapter"
  
end
