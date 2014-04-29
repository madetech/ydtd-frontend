# Middleman config
#
# This file loads in required gems along with configuration files found in the
# `config/` directory of this project.
#
# There is no need to edit this file directly.
#
require 'rubygems'
require 'bundler/setup'

require 'modular-scale'
require 'middleman-livereload'
require 'middleman-minify-html'

[:settings, :build, :helpers, :pages].each do |f|
  file = "config/#{f}.rb"
  instance_eval(File.read(file), file, 1)
end
