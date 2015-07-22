require 'brew_sparkling/action/install/base'
require 'brew_sparkling/action/install/fetch'
require 'brew_sparkling/action/install/unpack'
require 'brew_sparkling/action/install/build'
require 'brew_sparkling/action/install/install_app'
require 'brew_sparkling/action/install/change_id'

module BrewSparkling
  module Handler
    class Install < Base
      command :fetch, :unpack, :build, :install_app, :change_id

      def fetch(name=nil)
        Action::Install::Fetch.new.call
      end

      def unpack(name=nil)
        Action::Install::Unpack.new.call
      end

      def build(name=nil)
        Action::Install::Build.new.call
      end

      def install_app
        Action::Install::InstallApp.new.call
      end

      def change_id
        Action::Install::ChangeId.new.call
      end
    end
  end
end
