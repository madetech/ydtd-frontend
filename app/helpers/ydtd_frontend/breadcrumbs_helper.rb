module YdtdFrontend
  module BreadcrumbsHelper
    def breadcrumbs(*breadcrumbs)
      @breadcrumbs ||= []

      unless breadcrumbs.empty?
        @breadcrumbs.concat(breadcrumbs)
      end

      @breadcrumbs
    end
  end
end
