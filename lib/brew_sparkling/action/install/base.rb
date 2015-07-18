require 'brew_sparkling/recipe/recipe'

module BrewSparkling
  module Action
    module Install
      class Base
        def recipe
          # dummy
          Recipe::Recipe.new 'hello', 'https://github.com/mzp/helloworld-ios/archive/0.4.0.tar.gz', '0.4.0'
        end

        def tarball_path
          @tarball_path ||= Homebrew::Download.new(recipe).call
        end
      end
    end
  end
end
