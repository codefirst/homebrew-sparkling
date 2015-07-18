require 'brew_sparkling/location'

module BrewSparkling
  module Recipe
    class Recipe

      attr_reader :name, :url, :version

      def initialize(name, url, version)
        @name = name
        @url = url
        @version = version
      end

      def build_path
        Location.build_path.join(name, version)
      end
    end
  end
end
