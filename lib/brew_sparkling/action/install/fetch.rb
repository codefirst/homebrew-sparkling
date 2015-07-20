require 'brew_sparkling/homebrew/download'

module BrewSparkling
  module Action
    module Install
      class Fetch < Base
        def call
          tarball_path
        end
      end
    end
  end
end
