require 'lib/middleman/extensions/pages_directory'

set :source, 'app'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :partials_dir, 'views'
set :layouts_dir, 'views/layouts'
set :layout_dir, 'views/layouts'
set :pages_dir, '../styleguide'

activate :livereload
activate :i18n, :path => 'config/locales'
activate :pages_directory
