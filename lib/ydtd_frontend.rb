root = File.join(File.dirname(__FILE__), "..")
require "ydtd_frontend/version"

module YdtdFrontend
  def self.root
    File.join(File.dirname(__FILE__), "..")
  end

  def self.js_path
    File.join(File.dirname(__FILE__), "..", "js")
  end

  def self.scss_path
    File.join(File.dirname(__FILE__), "..", "scss")
  end

  if defined?(Rails::Engine)
    require "ydtd_frontend/engine"
  elsif defined?(Sprockets)
    require "ydtd_frontend/sprockets"
  end
end

if defined?(Compass)
  Compass::Frameworks.register("ydtd_frontend",
    :stylesheets_directory => File.join(root,"scss"),
    :templates_directory => File.join(root,"templates")
  )
end
