after_configuration do
  sprockets.append_path "#{root}/vendor/javascripts"
  sprockets.append_path "#{root}/vendor/stylesheets"
  sprockets.import_asset "modernizr.js"
  sprockets.import_asset "jquery.min.js"
end

compass_config do |config|
  config.output_style = :compact
end

page "/", :layout => "application"
page "/tabbed_lists.html", :layout => "application"
page "/tabbed_lists_2.html", :layout => "application"

activate :livereload
activate :i18n

set :source, "app"
set :partials_dir, "app/views"
set :layouts_dir, "app/views/layouts"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"

configure :build do
  set :js_compressor, Uglifier.new(:toplevel => true, :unsafe => true)
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
end
