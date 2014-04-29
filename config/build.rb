configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
end

compass_config do |config|
  config.output_style = :compact
end

after_configuration do
  sprockets.append_path "#{root}/vendor/assets/javascripts"
  sprockets.append_path "#{root}/vendor/assets/stylesheets"
  sprockets.import_asset 'modernizr.js'
  sprockets.import_asset 'jquery.min.js'
end
