require 'brew_sparkling/action/recipe/base'
require 'brew_sparkling/action/recipe/search'

module BrewSparkling
  module Handler
    class Recipe < Base
      command :search, :list

      def search
        args.each do |name|
          Action::Recipe::Search.new.call(name)
        end
      end

      def list
        Action::Recipe::Search.new.call('')
      end
    end
  end
end
