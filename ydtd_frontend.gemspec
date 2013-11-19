$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ydtd-frontend"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ydtd-frontend"
  s.version     = YdtdFrontend::VERSION
  s.authors     = ["Seb Ashton", "Rory MacDonald", "Scott Mason"]
  s.email       = ["rory@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk"
  s.summary     = "Frontend website for the YDTD project."
  s.description = ""

  s.files = Dir["{app,vendor,lib}/**/*"] + ["README.md"]
  s.test_files = Dir["test/**/*"]
end
