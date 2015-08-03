require 'brew_sparkling/recipe/builder'
require 'brew_sparkling/recipe/extension/path'
require 'brew_sparkling/recipe/Extension/build'

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
        @entries ||= begin
                       paths = path.children
                         .select { |path| path.basename.fnmatch?('*.rb') }
                         .each { |path| load path; path }
                       Builder.all.zip(paths).map do |klass, path|
                         klass.new(path).tap do |obj|
                           obj.extend Extension::Path
                           obj.extend Extension::Build
                         end
                       end
                     end
      end
    end
  end
end
