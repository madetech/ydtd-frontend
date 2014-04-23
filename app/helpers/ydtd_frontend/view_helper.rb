module YdtdFrontend
  module ViewHelper
    def yield_content(content_name)
      if defined?(Middleman)
        super(content_name)
      else
        content_for(content_name)
      end
    end

    def partial(*args)
      if defined?(Middleman)
        super(*args)
      else
        render(*args)
      end
    end
  end
end
