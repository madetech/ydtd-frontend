$:.push File.expand_path('../lib', __FILE__)

require 'ydtd_frontend/version'

Gem::Specification.new do |s|
  s.name        = 'ydtd_frontend'
  s.version     = YdtdFrontend::VERSION
  s.authors     = ['Rory MacDonald', 'Seb Ashton', 'Scott Mason', 'Luke Morton']
  s.email       = ['rory@madebymade.co.uk']
  s.homepage    = 'https://www.madetech.co.uk/'
  s.summary     = 'Frontend component for the YDTD application and marketing site.'
  s.description = ''

  s.add_dependency 'rails', '>= 3.2'
  s.add_dependency 'modular-scale', '2.0.4'

  s.require_paths = ['lib', 'app', 'vendor']
  s.files = Dir['{lib,app,vendor}/**/*'] + ['README.md', 'LICENSE']
end
