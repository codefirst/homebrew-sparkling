require 'brew_sparkling/action/install/base'
require 'brew_sparkling/action/install/fetch'
require 'brew_sparkling/action/install/unpack'
require 'brew_sparkling/action/install/build'

module BrewSparkling
  module Handler
    class Install < Base
      command :fetch, :unpack, :build

      def fetch(name=nil)
        Action::Install::Fetch.new.call
      end

      def unpack(name=nil)
        Action::Install::Unpack.new.call
      end

      def build(name=nil)
        Action::Install::Build.new.call
      end
    end
  end
end
