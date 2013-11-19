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

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "sass", ">= 3.1.20"
  s.add_dependency "modular-scale", ">= 1.0.6"
  s.add_dependency "oj", ">= 2.2.2"
  s.add_dependency "therubyracer", "0.12.0"

  s.require_paths = ["lib", "app", "vendor"]
  s.files = Dir["{lib,app,vendor}/**/*"] + ["README.md"]
end
