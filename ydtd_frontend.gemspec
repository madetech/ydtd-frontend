$:.push File.expand_path("../lib", __FILE__)

require "ydtd_frontend/version"


Gem::Specification.new do |s|
  s.name        = "ydtd_frontend"
  s.version     = YdtdFrontend::VERSION
  s.authors     = ["Rory MacDonald", "Seb Ashton", "Scott Mason"]
  s.email       = ["rory@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk"
  s.summary     = "Frontend component for the YDTD application and marketing site."
  s.description = ""

  s.add_dependency "middleman", "3.2.2"
  s.add_dependency "middleman-livereload", "3.1.0"
  s.add_dependency "middleman-minify-html", "3.1.1"
  s.add_dependency "sass", "3.2.17"
  s.add_dependency "compass", "0.12.4"
  s.add_dependency "modular-scale", "2.0.4"
  s.add_dependency "oj", "2.2.3"
  s.add_dependency "therubyracer", "0.12.0"

  s.require_paths = ["lib", "app", "vendor"]
  s.files = Dir["{lib,app,vendor}/**/*"] + ["README.md"]
end
