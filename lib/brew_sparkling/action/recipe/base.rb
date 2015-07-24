require 'brew_sparkling/recipe/recipes'

module BrewSparkling
  module Action
    module Recipe
      class Base
        private

        def recipes
          @recipes ||= ::BrewSparkling::Recipe::Recipes.default
        end
      end
    end
  end
end
