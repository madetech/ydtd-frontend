require 'app/helpers/ydtd_frontend/user_mailer_helper'

helpers YdtdFrontend::UserMailerHelper

after_configuration do
  sprockets.append_path "#{root}/vendor/assets/javascripts"
  sprockets.append_path "#{root}/vendor/assets/stylesheets"
  sprockets.import_asset "modernizr.js"
  sprockets.import_asset "jquery.min.js"
end

compass_config do |config|
  config.output_style = :compact
end

set :source, "app"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layouts_dir, 'views/layouts'

page "/", :layout => "application"
page "/tabbed_lists.html", :layout => "application"
page "/tabbed_lists_2.html", :layout => "application"
page "/profile.html", :layout => "application"
page "/email.html", :layout => "mail"

page "/marketing/"

activate :livereload
activate :i18n

configure :build do
  set :js_compressor, Uglifier.new(:toplevel => true, :unsafe => true)
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
end
