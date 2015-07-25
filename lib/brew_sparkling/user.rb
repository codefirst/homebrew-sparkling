require 'brew_sparkling/logger'
require 'brew_sparkling/gateway/xcode'
require 'digest/sha1'

module BrewSparkling
  class User
    class <<self
      def default
        @user ||= new
      end
    end

    def account
      @account ||= find_or_first(accounts) { |account|
        account.username == env(:username)
      }.tap { |account|
        logger.info "Account: #{account.username} (#{env_name(:username)}"
      }
    end

    def certificate
      @certificate ||= find_or_first(certificates) { |certificate|
        certificate.commonName == env(:certificate)
      }.tap { |certificate|
        logger.info "Certificate: #{certificate.commonName} (#{env_name(:certificates)})"
      }
    end

    def device
      @device ||= find_or_first(devices) { |device|
        device.name == env(:device)
      }.tap { |device|
        logger.info "Device: #{device.name} (#{env_name(:device)})"
      }
    end

    def gateway
      @gateway ||= Gateway::Xcode.default.tap do |gateway|
        if gateway
          logger.info "Xcode gateway: #{gateway.url}"
        else
          error 'cannot discover Xcode. Please invoke Xcode.'
        end
      end
    end

    def postfix
      Digest::SHA1.hexdigest account.username
    end

    private

    def error(message)
      logger.error message
      exit 1
    end

    def accounts
      @accounts ||= gateway.accounts
    end

    def certificates
      @certificates ||= gateway.certificates
    end

    def devices
      @devices ||= gateway.devices
    end

    def env_name(name)
      "BREW_SPARKLING_#{name.to_s.upcase}"
    end

    def env(name)
      ENV[env_name(name)]
    end

    def find_or_first(xs, &f)
      first = proc { xs.first }
      xs.find(first, &f)
    end

    def logger
      @logger ||= Logger.default
    end
  end
end
