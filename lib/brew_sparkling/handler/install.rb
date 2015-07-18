require 'brew_sparkling/action/install/base'
require 'brew_sparkling/action/install/fetch'
require 'brew_sparkling/action/install/unpack'

module BrewSparkling
  module Handler
    class Install < Base
      command :fetch, :unpack

      def fetch(name=nil)
        Action::Install::Fetch.new.call
      end

      def unpack(name=nil)
        Action::Install::Unpack.new.call
      end
    end
  end
end
