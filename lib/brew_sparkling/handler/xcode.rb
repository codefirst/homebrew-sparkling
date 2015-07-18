require 'brew_sparkling/action/xcode/base'
require 'brew_sparkling/action/xcode/discover'
require 'brew_sparkling/action/xcode/devices'
require 'brew_sparkling/action/xcode/accounts'
require 'brew_sparkling/action/xcode/certificates'

# Show xcode info
module BrewSparkling
  module Handler
    # show xcode info
    class Xcode < Base
      command :devices, :discover, :accounts, :certificates

      def discover
        Action::Xcode::Discover.new.call
      end

      def devices
        Action::Xcode::Devices.new.call
      end

      def accounts
        Action::Xcode::Accounts.new.call
      end

      def certificates
        Action::Xcode::Certificates.new.call
      end

      def gateway
        Gateway::Xcode.default
      end
    end
  end
end
