require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    class Recipe

      attr_reader :name, :url, :version

      def initialize(name, url, version, &build_code)
        @name = name
        @url = url
        @version = version
        @build_code = build_code
      end

      def build_path
        Location.build_path.join(name, version)
      end

      def archive_path
        Location.archive_path.join(name, version)
      end

      def xcpretty
        @xcpretty ||= if system('which xcpretty > /dev/null')
                        '| xcpretty'
                      else
                        ''
                      end
      end

      def build
        instance_eval(&@build_code)
      end
    end
  end
end
