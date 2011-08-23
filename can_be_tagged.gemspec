$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "can_be_tagged/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "can_be_tagged"
  s.version     = CanBeTagged::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CanBeTagged."
  s.description = "TODO: Description of CanBeTagged."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0.rc6"

  s.add_development_dependency "sqlite3"
end
