require 'brew_sparkling/user'
require 'brew_sparkling/recipe/recipes'

module BrewSparkling
  module Action
    module Install
      class Base
        attr_reader :name
        def initialize(name)
          @name = name
        end

        def logger
          @logger ||= Logger.default
        end

        def recipe
          recipes.find { |recipe| recipe.name == name }
        end

        def user
          User.new
        end

        def recipes
          @@recipes ||= BrewSparkling::Recipe::Recipes.default
        end

        def tarball_path
          @tarball_path ||= Homebrew::Download.new(recipe).call
        end
      end
    end
  end
end
