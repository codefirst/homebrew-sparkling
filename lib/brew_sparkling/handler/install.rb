require 'brew_sparkling/action/install/fetch'

module BrewSparkling
  module Handler
    class Install < Base
      command :fetch

      def fetch
        Action::Install::Fetch.new.call
      end
    end
  end
end

