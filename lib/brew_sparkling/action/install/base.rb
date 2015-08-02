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
          User.default
        end

        def recipes
          @@recipes ||= BrewSparkling::Recipe::Recipes.default
        end

        def tarball_path
          @tarball_path ||= Homebrew::Download.new(recipe).call
        end

        def at_build_path(&f)
          subdir = recipe.build_path.children

          case subdir.size
          when 0
            fail 'Empty Archive'
          when 1
            Dir.chdir(subdir.first, &f)
          else
            Dir.chdir(recipe.build_path, &f)
          end
        end
      end
    end
  end
end
