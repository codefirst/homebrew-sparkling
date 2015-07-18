require 'brew_sparkling/gateway/xcode'

# Show xcode info
module BrewSparkling
  module Handler
    # show xcode info
    class Xcode < Base
      command :devices, :discover, :accounts, :certificates

      def discover
        Gateway::Xcode.availables do |host, port|
          puts "http://#{host}::#{port}"
        end
      end

      def devices
        gateway.devices.each do |device|
          puts "#{device.name}" if device.platform == 'iphoneos'
        end
      end

      def accounts
        gateway.accounts.each do |account|
          puts account.username
        end
      end

      def certificates
        gateway.certificates.each do |certificate|
          puts certificate.commonName
        end
      end

      def gateway
        Gateway::Xcode.default
      end
    end
  end
end
