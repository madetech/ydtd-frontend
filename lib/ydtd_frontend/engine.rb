module YdtdFrontendToolkit
  class Engine < Rails::Engine
    # Save this block, we'll use it in two calls to .initializer
    add_paths_block = lambda { |app|
      app.config.assets.paths << File.expand_path("../../source/stylesheets", __FILE__)
      app.config.assets.paths << File.expand_path("../../source/javascripts", __FILE__)
      app.config.assets.paths << File.expand_path("../../source/fonts", __FILE__)
      app.config.assets.paths << File.expand_path("../../source/images", __FILE__)

      # Ensure Zepto and Modernizr are precompiled in production
      app.config.assets.precompile += %w(vendor/zepto.js vendor/custom.modernizr.js)
    }

    # Standard initializer
    initializer 'ydtd.update_asset_paths', &add_paths_block

    # Special initializer lets us precompile assets without fully initializing
    initializer 'ydtd.update_asset_paths', :group => :assets,
                &add_paths_block

  end
end
