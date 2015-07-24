require 'brew_sparkling/recipe/dsl'

module BrewSparkling
  module Recipe
    class Recipes
      include Enumerable

      class << self
        def default
          new File.expand_path('../../../../recipe', Pathname.new(__FILE__).realpath)
        end
      end

      attr_reader :path
      def initialize(path)
        @path = Pathname.new(path)
      end

      def each(&f)
        entries.each(&f)
      end

      private

      def dsl
        @dsl ||= Dsl.new
      end

      def entries
        @entries = path.children
          .select { |path| path.basename.fnmatch?('*.rb') }
          .map { |path| dsl.eval File.read(path) }
      end
    end
  end
end
