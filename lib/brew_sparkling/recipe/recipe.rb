require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    class Recipe

      attr_reader :name, :url, :version, :app_name

      def initialize(name, url, version, app_name, &build_code)
        @name = name
        @url = url
        @version = version
        @app_name = app_name
        @build_code = build_code
      end

      def build_path
        Location.build_path.join(name, version)
      end

      def archive_path
        Location.archive_path.join(name, version)
      end

      def app_path
        Location.archive_path.join(name, "#{version}.xcarchive", 'Products', 'Applications', "#{app_name}.app")
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
