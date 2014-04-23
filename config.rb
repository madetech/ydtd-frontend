require 'rubygems'
require 'bundler/setup'

require 'modular-scale'
require 'middleman-livereload'
require 'middleman-minify-html'

require 'app/helpers/ydtd_frontend/view_helper'
require 'app/helpers/ydtd_frontend/mailer_helper'
require 'app/helpers/ydtd_frontend/colors_helper'
require 'app/helpers/ydtd_frontend/breadcrumbs_helper'
require 'app/helpers/ydtd_frontend/flash_helper'

module MockHelper
  def logo_url
    'http://placehold.it/170x62/00cdff/ffffff/'
  end

  def link_to_unless_current(*args)
    link_to(*args)
  end

  class Flash
    def empty?; true; end
  end

  def flash
    Flash.new
  end

  def tracking
    {}
  end
end

class String
  def html_safe
    to_s
  end
end

helpers YdtdFrontend::ViewHelper
helpers YdtdFrontend::MailerHelper
helpers YdtdFrontend::ColorsHelper
helpers YdtdFrontend::BreadcrumbsHelper
helpers YdtdFrontend::FlashHelper
helpers MockHelper

breadcrumbs({:path => '#', :title => 'People'},
            {:path => '#', :title => 'Emile Swartz'})

set :source, "app"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :partials_dir, 'views'
set :layouts_dir, 'views/layouts'
set :layout_dir, 'views/layouts'

page "/", :layout => :application
page "/tabbed_lists.html", :layout => :application
page "/tabbed_lists_2.html", :layout => :application
page "/profile.html", :layout => :application
page "/email.html", :layout => :mail
page "/marketing/"

activate :livereload
activate :i18n, :path => 'config/locales'

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
  sprockets.import_asset "modernizr.js"
  sprockets.import_asset "jquery.min.js"
end
