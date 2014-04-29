$:.push File.expand_path("../lib", __FILE__)

require "ydtd_frontend/version"

Gem::Specification.new do |s|
  s.name        = "ydtd_frontend"
  s.version     = YdtdFrontend::VERSION
  s.authors     = ["Rory MacDonald", "Seb Ashton", "Scott Mason", "Luke Morton"]
  s.email       = ["rory@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk"
  s.summary     = "Frontend component for the YDTD application and marketing site."
  s.description = ""

  s.add_dependency "rails", "3.2.17"

  s.require_paths = ["lib", "app", "vendor"]
  s.files = Dir["{lib,app,vendor}/**/*"] + ["README.md", "LICENSE"]
end
