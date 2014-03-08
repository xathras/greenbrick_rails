$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "greenbrick_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "greenbrick_rails"
  s.version     = GreenbrickRails::VERSION
  s.authors     = ["Andrew Kothmann"]
  s.email       = ["akothmann@iexposure.com"]
  s.homepage    = "https://github.com/xathras/greenbrick_rails"
  s.summary     = "Integrates the Greenbrick gem into rails"
  s.description = "Integrate the Greenbrick gem into rails. Adds app_config method to ActiveRecord, ActionController, and ActionView."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "> 3.2"
  s.add_dependency 'greenbrick'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
end
