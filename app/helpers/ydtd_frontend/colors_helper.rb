module YdtdFrontend
  module ColorsHelper
    def colors
      @colors ||= ColorLoader.new(:path => 'config').colors
    end

    class ColorLoader
      def initialize(config) 
        @path = config[:path]
      end

      def colors
        @colors ||= symbolize_keys(YAML.load_file("#{path}/colors.yml"))
      end

      private

      attr_reader :path

      def symbolize_keys(hash)
        hash.inject({}) {|memo, (k,v)| memo[k.to_sym] = v; memo}
      end
    end
  end
end
