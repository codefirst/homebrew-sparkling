require 'brew_sparkling/action/install/base'
require 'brew_sparkling/action/install/fetch'
require 'brew_sparkling/action/install/unpack'
require 'brew_sparkling/action/install/build'
require 'brew_sparkling/action/install/install_app'
require 'brew_sparkling/action/install/change_id'
require 'brew_sparkling/action/install/request_provisioning'

module BrewSparkling
  module Handler
    class Install < Base
      command :install

      def fetch(name)
        Action::Install::Fetch.new(name).call
      end

      def unpack(name)
        Action::Install::Unpack.new(name).call
      end

      def build(name)
        Action::Install::Build.new(name).call
      end

      def install_app(name)
        Action::Install::InstallApp.new(name).call
      end

      def change_id(name)
        Action::Install::ChangeId.new(name).call
      end

      def request_provisioning(name)
        Action::Install::RequestProvisioning.new(name).call
      end

      def install(name)
        unpack name

        change_id name
        request_provisioning name

        build name

        install_app name
      end
    end
  end
end
