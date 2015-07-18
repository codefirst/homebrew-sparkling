require 'brew_sparkling/recipe/recipe'
require 'brew_sparkling/homebrew/download'

module BrewSparkling
  module Action
    module Install
      class Fetch
        def call
          # specify by somehow
          dummy = Recipe::Recipe.new 'hello', 'https://github.com/mzp/helloworld-ios/archive/0.4.0.tar.gz', '0.4.0'
          puts dummy

          Homebrew::Download.new(dummy).call
        end
      end
    end
  end
end
