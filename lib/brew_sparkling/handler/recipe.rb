require 'brew_sparkling/action/recipe/base'
require 'brew_sparkling/action/recipe/search'

module BrewSparkling
  module Handler
    class Recipe < Base
      command :search, :list

      def search(name, *_)
        Action::Recipe::Search.new.call(name)
      end

      def list
        Action::Recipe::Search.new.call('')
      end
    end
  end
end
