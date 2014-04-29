class Middleman::Extensions::PagesDirectory < Middleman::Extension
  register :pages_directory

  option :pages_dir, 'styleguide', 'Directory for site pages'

  def manipulate_resource_list(resources)
    pages_directory = File.join(app.source_dir, options.pages_dir) << '/'
    pages = Dir[File.join(pages_directory, '**/*')]

    # Don't map directories
    pages.reject! { |path| File.directory?(path) }

    resources + pages.map do |source|
      page = app.sitemap.extensionless_path(source[pages_directory.length..-1])
      p page
      Middleman::Sitemap::Resource.new(app.sitemap, page, source)
    end
  end
end
